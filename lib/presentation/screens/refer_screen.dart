import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../custom_widgets/my_app_bar_without_logo.dart';
import '../ui/app_text_style.dart';
import '../ui/image_assets.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({Key? key}) : super(key: key);

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithOutLogo(),
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
      child: Align(
        alignment: Alignment.topLeft,
        child: fitBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StringProvider.refer.text(AppTextStyle.enterNumberStyle),
              StringProvider.accountSummaryDescription
                  .text(AppTextStyle.enterNumberSubHeadingStyle)
            ],
          ).padding(
              insets:
                  EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sw)),
        ),
      ),
    );
  }

  Widget _lowerSideContent() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StringProvider.referList.text(AppTextStyle.referListStyle),
            SizedBox(
              height: 0.02.sw,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(right: 0.01.sw),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x1a000000),
                                blurRadius: 20,
                                spreadRadius: 0,
                                offset: Offset(0, 10))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.05.sw, horizontal: 0.05.sw),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To driver",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Expanded(
                                  flex: 4,
                                  child: StringProvider.toDriver
                                      .text(AppTextStyle.toDriverTxtStyle)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.01.sw),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x1a000000),
                                blurRadius: 20,
                                spreadRadius: 0,
                                offset: Offset(0, 10))
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.05.sw, horizontal: 0.05.sw),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "To Customer",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16.sp),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Expanded(
                                  flex: 4,
                                  child: StringProvider.toDriver
                                      .text(AppTextStyle.toDriverTxtStyle)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            InkWell(
              //onTap: accountsStore.onCurrentBalance,
              child: Container(
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
                  padding: EdgeInsets.symmetric(
                      vertical: 0.05.sw, horizontal: 0.05.sw),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //StringProvider.accountSummary.text(AppTextStyle.enterNumberStyle),
                            Text(StringProvider.referToDriver,
                                style: TextStyle(
                                    color: AppColors.appGreery,
                                    fontSize: 16.sp)),
                            SizedBox(
                              height: 0.01.sh,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.Mercury,
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: AppColors.appGreens),
                                  ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
                                child: Row(
                                  children: [
                                    Observer(
                                      builder: (context) {
                                        return Text("SEGFERFYUF",
                                            style: TextStyle(
                                                color: AppColors.secondaryVariant,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold));
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 0.05.sw),
                                      child: Text("Tap to Copy",
                                          style: TextStyle(
                                              color: AppColors.primaryVariant,
                                              fontSize: 15.sp)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(0.04.sw),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              border: Border.all(color: AppColors.appGreens),
                            ),
                            child: SvgPicture.asset(ImageAssets.shareIcons),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 0.02.sh,
            ),
            InkWell(
              //onTap: accountsStore.onCurrentBalance,
              child: Container(
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
                  padding: EdgeInsets.symmetric(
                      vertical: 0.05.sw, horizontal: 0.05.sw),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //StringProvider.accountSummary.text(AppTextStyle.enterNumberStyle),
                            Text(StringProvider.referToCustomer,
                                style: TextStyle(
                                    color: AppColors.appGreery,
                                    fontSize: 16.sp)),
                            SizedBox(
                              height: 0.01.sh,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.Mercury,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                border: Border.all(color: AppColors.appGreens),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
                                child: Row(
                                  children: [
                                    Observer(
                                      builder: (context) {
                                        return Text("SEGFERFYUF",
                                            style: TextStyle(
                                                color: AppColors.secondaryVariant,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.bold));
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 0.05.sw),
                                      child: Text("Tap to Copy",
                                          style: TextStyle(
                                              color: AppColors.primaryVariant,
                                              fontSize: 15.sp)),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.all(0.04.sw),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                              BorderRadius.all(Radius.circular(100)),
                              border: Border.all(color: AppColors.appGreens),
                            ),
                            child: SvgPicture.asset(ImageAssets.shareIcons),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
