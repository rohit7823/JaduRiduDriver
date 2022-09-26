import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/screen_wtih_extras.dart';
import '../stores/profile_view_model.dart';
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
  late final ProfileViewModel profileViewModel;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    profileViewModel = ProfileViewModel();
    profileViewModel.getShortProfileData();
    super.initState();
    _disposers = [
      reaction((p0) => profileViewModel.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          widget.sharedStore.onChange(
            p0,
          );
        }
      })
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((element) {
      element.call();
    });
    super.dispose();
  }

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
    return InkWell(
      onTap: profileViewModel.onProfileDetails,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(100.r))),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Align(
                    alignment: Alignment.center,
                    child: Observer(
                      builder: (BuildContext context) {
                        if (profileViewModel.imageURL.isEmpty) {
                          return const CircleAvatar(
                            foregroundImage:
                                AssetImage(ImageAssets.placeHolder),
                            backgroundColor: AppColors.primary,
                            radius: 40,
                          );
                        } else {
                          return CircleAvatar(
                            foregroundImage:
                                NetworkImage(profileViewModel.imageURL),
                            backgroundColor: AppColors.primary,
                            radius: 40,
                          );
                        }
                        /*if (profileViewModel.isLoading) {
                          return Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height: 0.10.sw,
                              width: 0.10.sw,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {

                        }*/
                      },
                    ))),
            Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 0.03.sw,
                    ),
                    Observer(
                      builder: ((context) {
                        if (profileViewModel.isLoading) {
                          return Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              height: 0.10.sw,
                              width: 0.10.sw,
                              child: CircularProgressIndicator(color: Colors.red),
                            ),
                          );
                        } else {
                          return Text(
                            profileViewModel.driverName,
                            style: AppTextStyle.profileText,
                          );
                        }
                      }),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: StringProvider.userProfile
                                .text(AppTextStyle.profileNameText),
                          ),
                          Expanded(
                            flex: 2,
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
                    child: SvgPicture.asset(ImageAssets.tripIcon),
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
                    child: SvgPicture.asset(ImageAssets.walletIcon),
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
                    child: SvgPicture.asset(ImageAssets.raferIcon),
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
                    child: SvgPicture.asset(ImageAssets.paymentIcon),
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
                    child: SvgPicture.asset(ImageAssets.languagetIcon),
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
                    child:
                        SvgPicture.asset(ImageAssets.termsAndConditionsIcons),
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
                    child: SvgPicture.asset(ImageAssets.privacyIcons),
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
                    child: SvgPicture.asset(ImageAssets.refundIcons),
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
                    child: SvgPicture.asset(ImageAssets.helpIcons),
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
                    child: SvgPicture.asset(ImageAssets.emergencyIcons),
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
                    child: SvgPicture.asset(ImageAssets.logoutIcons),
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
