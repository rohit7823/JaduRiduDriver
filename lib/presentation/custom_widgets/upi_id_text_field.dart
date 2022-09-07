import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/domain/upi_id.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class UpiIdTextField extends StatelessWidget {
  List<UpiID> upiIds;
  UpiID? selected;
  bool loading;
  String placeHolder;
  Function(UpiID?) onSelect;
  Function(String) onChange;
  TextEditingController? controller;
  VoidCallback? onEditComplete;
  String upiValidationLabel;

  UpiIdTextField(
      {Key? key,
      required this.upiIds,
      required this.loading,
      required this.selected,
      this.placeHolder = "",
      this.controller,
      this.onEditComplete,
      required this.onChange,
      this.upiValidationLabel = "",
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StringProvider.enterYourUpiID
            .text(AppTextStyle.requiredStepsStyle)
            .padding(insets: EdgeInsets.only(bottom: 0.03.sw)),
        Container(
          width: 0.90.sw,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
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
          ),
          child: Row(
            children: [
              expand(
                  flex: 7,
                  child: TextField(
                    onChanged: onChange,
                    controller: controller,
                    keyboardType: TextInputType.visiblePassword,
                    style: AppTextStyle.transactionPersonStyle
                        .copyWith(fontSize: 18.sp),
                    onEditingComplete: onEditComplete,
                    decoration: InputDecoration(
                        hintText: placeHolder,
                        filled: false,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r))),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r))),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.r),
                                bottomLeft: Radius.circular(16.r)))),
                  )),
              expand(
                  flex: 4,
                  child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                          value: selected,
                          onChanged: onSelect,
                          buttonPadding: EdgeInsets.symmetric(
                              horizontal: 0.03.sw, vertical: 0.03.sw),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.Gray,
                          ),
                          dropdownMaxHeight: 0.30.sh,
                          dropdownDecoration: BoxDecoration(
                              border:
                                  Border.all(color: AppColors.Gray, width: 1),
                              borderRadius: BorderRadius.circular(16.r)),
                          alignment: Alignment.center,
                          buttonDecoration: BoxDecoration(
                              color: AppColors.upiIdDropDownBg,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(16.r),
                                  bottomRight: Radius.circular(16.r))),
                          items: upiIds
                              .map((e) => DropdownMenuItem(
                                  alignment: Alignment.centerLeft,
                                  value: e,
                                  child: e.name.text(AppTextStyle.normal)))
                              .toList())))
            ],
          ),
        ),
        if (upiValidationLabel.isNotEmpty)
          upiValidationLabel
              .text(upiValidationLabel == StringProvider.UpiIsValid
                  ? AppTextStyle.mandatoryFieldStyle
                      .copyWith(color: AppColors.appGreen)
                  : AppTextStyle.mandatoryFieldStyle)
              .padding(insets: EdgeInsets.all(0.02.sw))
      ],
    );
  }
}
