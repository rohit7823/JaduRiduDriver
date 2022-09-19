import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../ui/app_text_style.dart';
import '../ui/image_assets.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class MoreScreen extends StatefulWidget {
  final SharedStore sharedStore;

  const MoreScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            expand(flex: 2, child: _upperSideContent()),
            expand(flex: 8, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(100.r))),
      child: Row(
        children: [
          Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(ImageAssets.userImage),
              )),
          Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 0.03.sw,
                  ),
                  StringProvider.userName.text(AppTextStyle.profileText),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: StringProvider.userProfile
                              .text(AppTextStyle.profileNameText),
                        ),
                        Expanded(
                          flex: 10,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(Icons.edit, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Widget _lowerSideContent() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
      child: ListView(
        children: [
          SizedBox(
            height: 0.03.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Trips",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wallet",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Refer",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Payment Details",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Language",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Terms and Condition",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Privacy Policy",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Refund Policy",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Help",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Emergency Support",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: AppColors.appGreens),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x1a000000),
                      blurRadius: 20,
                      spreadRadius: 0,
                      offset: Offset(0, 10))
                ]),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(ImageAssets.todaysPayment),
                  ),
                  Expanded(
                    flex: 8,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Logout",
                              style: TextStyle(
                                  color: AppColors.appMore,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.secondaryVariant,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
