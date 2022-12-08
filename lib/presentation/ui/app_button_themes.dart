import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

class AppButtonThemes {
  static var cancelBtnStyle = ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(392.w, 65.h)),
      backgroundColor: MaterialStateProperty.all(AppColors.btnGrey),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))));

  static var addCreditBtnStyle = ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(0.50.sw, 65.h)),
      backgroundColor: MaterialStateProperty.all(AppColors.primary),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r))));

  static var backBtnStyle = ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(0.50.sw, 65.h)),
      backgroundColor: MaterialStateProperty.all(AppColors.appBlack),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))));

  static var passBtnTheme = ButtonStyle(
      //fixedSize: MaterialStateProperty.all(Size(120.w, 60.h)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(AppColors.lightGray),
      side: MaterialStateProperty.all(const BorderSide(color: AppColors.white)),
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0.10.sw, vertical: 0.05.sw)),
      elevation: MaterialStateProperty.all(7),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: const BorderSide(color: Colors.white))));

  AppButtonThemes._();

  static var outlineButtonStyleUnselect = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
    backgroundColor: MaterialStateProperty.all(AppColors.white),
    shadowColor: MaterialStateProperty.all(AppColors.lightGray),
    side:
        MaterialStateProperty.all(const BorderSide(color: AppColors.lightGray)),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 0.10.sw, vertical: 0.05.sw)),
    elevation: MaterialStateProperty.all(7),
  );

  static var outlineButtonStyleSelect = ButtonStyle(
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r))),
    backgroundColor: MaterialStateProperty.all(AppColors.primary),
    shadowColor: MaterialStateProperty.all(AppColors.lightGray),
    side:
        MaterialStateProperty.all(const BorderSide(color: AppColors.lightGray)),
    padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 0.10.sw, vertical: 0.05.sw)),
    elevation: MaterialStateProperty.all(7),
  );

  static var defaultStyle = ButtonStyle(
      fixedSize: MaterialStateProperty.all(Size(392.w, 65.h)),
      backgroundColor: MaterialStateProperty.all(AppColors.Black),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r))));
}
