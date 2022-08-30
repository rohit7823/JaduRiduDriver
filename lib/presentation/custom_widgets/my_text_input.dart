import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class MyTextInput extends StatefulWidget {
  Function(String) onTextChange;
  String? placeholderText;
  TextInputType keyboardType;
  TextInputAction inputAction;
  String? errorText;
  double? prefferedWidth;
  bool isMandatory = false;
  List<TextInputFormatter> formatters;
  MyTextInput(
      {Key? key,
      required this.onTextChange,
      this.placeholderText,
      required this.keyboardType,
      required this.inputAction,
      this.prefferedWidth,
      this.formatters = const [],
      required this.isMandatory,
      this.errorText})
      : super(key: key);

  @override
  State<MyTextInput> createState() => _MyTextInputState(
      onTextChange,
      keyboardType,
      inputAction,
      errorText,
      placeholderText,
      prefferedWidth,
      formatters);
}

class _MyTextInputState extends State<MyTextInput> {
  Function(String) onTextChange;
  String? _placeholderText;
  TextInputType _inputType;
  TextInputAction action;
  String? errorText;
  double? _prefferedWidth;
  List<TextInputFormatter> formatters;

  late final TextEditingController _controller;
  _MyTextInputState(
      this.onTextChange,
      this._inputType,
      this.action,
      this.errorText,
      this._placeholderText,
      this._prefferedWidth,
      this.formatters);

  @override
  void initState() {
    _controller = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: widget.isMandatory
                ? EdgeInsets.only(bottom: 0.03.sw)
                : EdgeInsets.zero,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.lightGray,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 7.0,
                    spreadRadius: 2.0,
                  ) //BoxShadow
                ],
              ),
              width: _prefferedWidth ?? 0.90.sw,
              child: TextField(
                controller: _controller,
                style: AppTextStyle.countryCodeStyle,
                onChanged: onTextChange,
                textCapitalization: TextCapitalization.words,
                keyboardType: _inputType,
                textInputAction: action,
                maxLines: 1,
                inputFormatters: formatters,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(color: AppColors.Acadia)),
                  errorStyle: AppTextStyle.errorStyle,
                  errorText: errorText,
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: AppColors.lightGray),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: const BorderSide(color: AppColors.lightGray),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: AppColors.lightGray)),
                  hintText: _placeholderText,
                ),
              ),
            ),
          ),
          if (widget.isMandatory)
            StringProvider.thisFieldIsMandatory
                .text(AppTextStyle.mandatoryFieldStyle)
        ],
      ),
    );
  }
}
