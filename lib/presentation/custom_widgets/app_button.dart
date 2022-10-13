import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class AppButton extends StatelessWidget {
  VoidCallback onClick;
  bool enable;
  bool showLoading;
  Widget? child;
  String label;

  AppButton(
      {Key? key,
      required this.onClick,
      this.enable = true,
      this.showLoading = false,
      required this.label,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onClick : null,
      style: enable
          ? AppButtonThemes.defaultStyle.copyWith(
              backgroundColor:
                  const MaterialStatePropertyAll(AppColors.primary))
          : AppButtonThemes.cancelBtnStyle,
      child: showLoading
          ? CircularProgressIndicator(
              color: AppColors.Acadia,
            )
          : child ?? label.text(AppTextStyle.btnTextStyleBlack),
    );
  }
}
