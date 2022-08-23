import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../../core/domain/mobile_number_code.dart';
import '../../utills/number_textInput_formatter.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';
import 'country_codes_drop_down.dart';

class MobileNumberWithCodesTextField extends StatefulWidget {
  FocusNode node;
  TextEditingController controller;
  Function(String) onTextChange;
  Function(MobileNumberCode?) onCodeSelect;
  List<MobileNumberCode> codes;
  Function onNumberCleared;
  bool gettingLoader;
  bool? isMandatory;
  Key key;

  MobileNumberWithCodesTextField(
      {required this.key,
      required this.node,
      required this.controller,
      required this.onTextChange,
      required this.codes,
      required this.onCodeSelect,
      required this.onNumberCleared,
      this.isMandatory,
      required this.gettingLoader})
      : super(key: key);

  @override
  State<MobileNumberWithCodesTextField> createState() =>
      _MobileNumberWithCodesTextFieldState(
          inputManager: node,
          inputController: controller,
          onChange: onTextChange,
          onSelect: onCodeSelect,
          dialCodes: codes,
          onClear: onNumberCleared,
          loader: gettingLoader,
          myKey: key);
}

class _MobileNumberWithCodesTextFieldState
    extends State<MobileNumberWithCodesTextField> {
  FocusNode inputManager;
  TextEditingController inputController;
  Function(String) onChange;
  Function onClear;
  Function(MobileNumberCode?) onSelect;
  List<MobileNumberCode> dialCodes;
  bool loader;
  Key myKey;

  _MobileNumberWithCodesTextFieldState(
      {required this.inputManager,
      required this.inputController,
      required this.onChange,
      required this.onClear,
      required this.onSelect,
      required this.dialCodes,
      required this.loader,
      required this.myKey});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: widget.isMandatory != null && widget.isMandatory! ? EdgeInsets.only(bottom: 0.03.sw) : EdgeInsets.zero,
          child: Container(
            key: myKey,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.lightGray,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: AppColors.lightGray,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                borderRadius: BorderRadius.circular(10.r)),
            child: FittedBox(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: 0.25.sw,
                    height: 0.15.sw,
                    child: CountryCodesDropDown(
                      dialCodes: dialCodes,
                      onSelect: onSelect,
                      gettingLoader: loader,
                    ),
                  ),
                  SizedBox(
                      width: 0.65.sw,
                      height: 0.15.sw,
                      child: _mobileNumberInputContent())
                ],
              ),
            ),
          ),
        ),
        if(widget.isMandatory != null && widget.isMandatory!) StringProvider.thisFieldIsMandatory.text(AppTextStyle.mandatoryFieldStyle)
      ],
    );
  }

  Widget _mobileNumberInputContent() {
    return TextField(
      focusNode: inputManager,
      mouseCursor: MouseCursor.defer,
      controller: inputController,
      onTap: () {
        FocusScope.of(context).requestFocus(inputManager);
      },
      onChanged: onChange,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: StringProvider.mobileNumber,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r)),
            borderSide: const BorderSide(
              color: AppColors.lightGray,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r)),
            borderSide: const BorderSide(
              color: AppColors.lightGray,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r)),
            borderSide: const BorderSide(
              color: AppColors.lightGray,
            )),
        suffixIcon: Padding(
          padding: EdgeInsets.all(18.w),
          child: InkWell(
            onTap: () {
              inputController.text = "";
              inputManager.unfocus();
              onClear();
            },
            child: SvgPicture.asset(
              ImageAssets.clearText,
              width: 17.w,
              height: 17.h,
            ),
          ),
        ),
      ),
      style: AppTextStyle.countryCodeStyle,
      keyboardType: TextInputType.phone,
      inputFormatters: [NumberTextInputFormatter()],
    );
  }
}
