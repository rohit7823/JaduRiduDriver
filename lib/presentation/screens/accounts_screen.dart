import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/accounts_view_model.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../stores/shared_store.dart';
import '../ui/image_assets.dart';

class AccountsScreen extends StatefulWidget {
  final SharedStore sharedStore;

  const AccountsScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  late final AccountsStore accountsStore;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    accountsStore = AccountsStore();
    accountsStore.getAcctountSummeryData();
    super.initState();
    _disposers = [
      reaction((p0) => accountsStore.currentChange, (p0) {
        if (p0 != null && p0 is ScreenWithExtras) {
          widget.sharedStore.onChange(p0);
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
              StringProvider.accountSummary.text(AppTextStyle.enterNumberStyle),
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
      child: ListView(
        children: [
          Observer(
            builder: ((context) {
              if (accountsStore.balanceLow.isNotEmpty) {
                return Container(
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
                          flex: 9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Your balance is low! ",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                              Text(
                                "Your bookings may drop if dues are not ",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              ),
                              Text(
                                "cleared immediately ",
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Padding(
                                padding: EdgeInsets.only(left: 0.05.sw),
                                child: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                )))
                      ],
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: 0.02.sw,
                );
              }
            }),
          ),
          SizedBox(
            height: 0.02.sw,
          ),
          InkWell(
            onTap: accountsStore.onCurrentBalance,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
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
                      flex: 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //StringProvider.accountSummary.text(AppTextStyle.enterNumberStyle),
                          Text(StringProvider.currentBalance,
                              style: TextStyle(
                                  color: AppColors.appGreery, fontSize: 16.sp)),
                          Row(
                            children: [
                              Observer(
                                builder: (context) {
                                  return Text(accountsStore.currentBalance,
                                      style: TextStyle(
                                          color: AppColors.secondaryVariant,
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.bold));
                                },
                              ),
                              Text("KM",
                                  style: TextStyle(
                                      color: AppColors.secondaryVariant,
                                      fontSize: 15.sp)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Padding(
                            padding: EdgeInsets.only(left: 0.05.sw),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.secondaryVariant,
                            )))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.02.sw,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                          Text(StringProvider.todaysPayment,
                              style: TextStyle(
                                  color: AppColors.secondaryVariant,
                                  fontSize: 16.sp)),
                          Text(StringProvider.noBalance,
                              style: TextStyle(
                                  color: AppColors.appGreens, fontSize: 11.sp)),
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
            height: 0.02.sw,
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
                          Text(StringProvider.paymentSummery,
                              style: TextStyle(
                                  color: AppColors.secondaryVariant,
                                  fontSize: 16.sp)),
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
          Padding(
            padding: EdgeInsets.only(left: 0.05.sw),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
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
                            Text("ONLINE COLLECTED",
                                style: TextStyle(
                                    color: AppColors.secondaryVariant,
                                    fontSize: 16.sp)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Observer(
                          builder: (context) {
                            return Text(
                              "₹${accountsStore.onlinePrice}",
                            );
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.01.sw,
          ),
          Padding(
            padding: EdgeInsets.only(left: 0.05.sw),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
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
                            Text("CASH COLLECTED",
                                style: TextStyle(
                                    color: AppColors.secondaryVariant,
                                    fontSize: 16.sp)),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Observer(
                          builder: (context) {
                            return Text("₹${accountsStore.cashPrice}");
                          },
                        ))
                  ],
                ),
              ),
            ),
          ),
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
                          Text("AMOUNT TRANSFER BY DAY",
                              style: TextStyle(
                                  color: AppColors.secondaryVariant,
                                  fontSize: 16.sp)),
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
