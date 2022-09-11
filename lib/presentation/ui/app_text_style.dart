import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/ui/app_fonts.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

class AppTextStyle {
  static var normal = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: AppColors.secondary);

  static var normalWhite = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: AppColors.white);

  static var btnTextStyleWhite = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
      color: AppColors.white);

  static var btnTextStyleRed = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
      color: AppColors.primaryVariant);

  static var enterNumberStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 30.sp,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: AppColors.Acadia);

  static var numberInputStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 18.sp,
      fontWeight: FontWeight.normal,
      decoration: TextDecoration.none,
      color: AppColors.Black);

  static var findAccountStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 18.sp,
      fontWeight: FontWeight.w800,
      color: AppColors.primaryVariant);

  static var selectRechargeStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Color(0xFF666666));

  static var detailsTypeItemTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.Black);

  static var bankDetailsTextInputStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.Black);

  static var errorStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.secondary);

  static var snackBarStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white);

  static var allCreditTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 40.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.Black);

  static var welComeTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white);

  static var userNameStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 30.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.white);

  static var transactionPersonStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.Black);

  static var transactionDescriptionStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.lightGray);

  static var transactionPriceStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 13.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.lightGray);

  static var transactionDateStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.Black);

  static var placerHolderStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
      color: Color(0xFF666666));

  static var driverRatingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 15.sp,
      fontWeight: FontWeight.normal,
      color: Color(0xFF666666));

  static var driverPersonalDetailContentStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.Black);

  static var driveDocumentNameStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.Black);

  static var reportForStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryVariant);

  static var stepsHeadingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF707070));

  static var enterDrivingLicNumberStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF707070));

  static var mcqTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF3E3E3E));

  static var requiredStepsStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF707070));

  static var applicationSubmittedStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 20.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black);

  AppTextStyle._();

  static var headingTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static var bodyTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.normal,
      fontSize: 18.sp,
      color: AppColors.Gray,
      decoration: TextDecoration.none);

  static var btnTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      color: AppColors.Gray,
      decoration: TextDecoration.none);

  static var btnTextStyleBlack = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w600,
      fontSize: 18.sp,
      color: AppColors.Black,
      decoration: TextDecoration.none);

  static var introHeadingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.normal,
      color: AppColors.Gray,
      fontSize: 35.sp,
      decoration: TextDecoration.none);

  static var enterNumberSubHeadingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w200,
      color: AppColors.Acadia,
      fontSize: 16.sp,
      decoration: TextDecoration.none);

  static var dialogBodyTextStyle = TextStyle(
      fontFamily: AppFonts.poppins, fontSize: 15.sp, color: Colors.black38);

  static var countryCodeStyle = TextStyle(
      fontFamily: AppFonts.poppins, fontSize: 18.sp, color: AppColors.Black);

  static var driverNameTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.Black);

  static var descriptionTextStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w300,
      fontSize: 12.sp,
      color: Color(0xFF666666));

  static var selectedTabStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: AppColors.primaryVariant);

  static var driverPersonalDetailStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.Black);

  static var selectPackageStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 23.sp,
      color: AppColors.primaryVariant);

  static var rechargeDoneStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
      color: AppColors.Black);

  static var kmCreditedStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w400,
      fontSize: 15.sp,
      color: const Color(0xFF666666));

  static var orderIdStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w400,
      fontSize: 20.sp,
      color: const Color(0xFF666666));

  static var introSubHeadingStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w300,
      fontSize: 18.sp,
      color: const Color(0xFF707070));

  static var dialogBtnStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
      color: AppColors.primaryVariant);

  static var mandatoryFieldStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: AppColors.primaryVariant);

  static var guidLineStyle = TextStyle(
      fontFamily: AppFonts.poppins,
      fontWeight: FontWeight.w500,
      fontSize: 15.sp,
      color: const Color(0xFF666666));
}
