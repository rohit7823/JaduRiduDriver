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
  Color loaderColor;
  Widget? child;
  String label;
  Color btnColor;

  AppButton(
      {Key? key,
      required this.onClick,
      this.enable = true,
      this.showLoading = false,
      required this.label,
      this.child,
      this.loaderColor = AppColors.Acadia,
      this.btnColor = AppColors.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enable ? onClick : null,
      style: enable
          ? AppButtonThemes.defaultStyle
              .copyWith(backgroundColor: MaterialStatePropertyAll(btnColor))
          : AppButtonThemes.cancelBtnStyle,
      child: showLoading
          ? CircularProgressIndicator(
              color: loaderColor,
            )
          : child ?? label.text(AppTextStyle.btnTextStyleBlack),
    );
  }
}
