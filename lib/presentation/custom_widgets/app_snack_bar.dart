import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class AppSnackBar {
  AppSnackBar._();

  static show(BuildContext context,
      {required String message, Function? clear}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.primaryVariant,
          content: message.text(AppTextStyle.snackBarStyle)),
    );
    clear?.call();
  }
}
