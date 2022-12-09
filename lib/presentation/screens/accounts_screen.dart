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
        if (p0 != null) {
          widget.sharedStore.onChange(p0);
        }
      }),
      reaction((p0) => widget.sharedStore.currentBalance, (p0) {
        if (p0 != null){
          accountsStore.currentBalance = p0;
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
    return Observer(builder: (BuildContext context) {
      if(accountsStore.isLoading){
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 0.10.sw,
            width: 0.10.sw,
            child: CircularProgressIndicator(),
          ),
        );
      }else{
        return Padding(padding: EdgeInsets.symmetric(vertical: 0.03.sw, horizontal: 0.03.sw),
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
                                offset: Offset(0, 0))
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
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 10, right: 5, left: 5),
                color: Color(0x56ffffff),
                child: InkWell(
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
                              offset: Offset(0, 0))
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.04.sw, horizontal: 0.04.sw),
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
                                        return Text(accountsStore.currentBalance ,
                                            style: TextStyle(
                                                color: AppColors.secondaryVariant,
                                                fontSize: 30.sp,
                                                fontWeight: FontWeight.bold));
                                      },
                                    ),
                                    SizedBox(
                                      width: 0.02.sw,
                                    ),
                                    Text("KM",
                                        style: TextStyle(
                                            color: AppColors.secondaryVariant,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              flex: 2,
                              child: Padding(
                                  padding: EdgeInsets.only(left: 0.07.sw),
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColors.secondaryVariant,
                                  )))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 0.02.sh,
                child: Divider(height: 8,thickness: 7,color: Color(0xd5e8e8e8),),
              ),
              Container(
                padding:EdgeInsets.all(5) ,
                child: InkWell(
                  onTap: accountsStore.onTodaysPayment,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1a000000),
                              blurRadius: 20,
                              spreadRadius: 0,
                              offset: Offset(0, 0))
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
                          const Expanded(
                              flex: 1,
                              child: Icon(
                Icons.keyboard_arrow_right,
                color: AppColors.secondaryVariant,
      ))
      ],
      ),
      ),
      ),
      ),
              ),
             SizedBox(
                height: 0.02.sh,
                child: Divider(height: 8,thickness: 7,color: Color(0xd5e8e8e8),),
              ),
     
              Container(
                padding: EdgeInsets.all(5),
                child: InkWell(
                  onTap: accountsStore.onPaymentSummery,
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
                              offset: Offset(0, 0))
                        ]),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(ImageAssets.paymentSummery),
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
                ),
              ),
              SizedBox(
                height: 0.01.sw,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.03.sw, right: 0.01.sw),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x1a000000),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, 0))
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.05.sw, horizontal: 0.05.sw),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(ImageAssets.onlineCollect),
                        ),
                        Expanded(
                          flex: 8,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(StringProvider.onlineCollect,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: AppColors.secondaryVariant,
                                        fontSize: 15.sp)),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
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
                padding: EdgeInsets.only(left: 0.03.sw, right: 0.01.sw),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x1a000000),
                            blurRadius: 20,
                            spreadRadius: 0,
                            offset: Offset(0, 0))
                      ]),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.05.sw, horizontal: 0.05.sw),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: SvgPicture.asset(ImageAssets.cashCollect),
                        ),
                        Expanded(
                          flex: 8,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(StringProvider.cashCollect,
                                maxLines: 1,
                                style: TextStyle(
                                    color: AppColors.secondaryVariant,
                                    fontSize: 15.sp)),
                          ),
                        ),
                        Expanded(
                            flex: 3,
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
              // SizedBox(
              //   height: 0.03.sw,
              // ),
              SizedBox(
                height: 0.03.sh,
                child: Divider(height: 8,thickness: 7,color: Color(0xd5e8e8e8),),
              ),
              Container(
                padding: EdgeInsets.only(top: 0.01.sh),
                child: InkWell(
                  onTap: accountsStore.onAmountTransfferedByDay,
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
                              offset: Offset(0, 0))
                        ]),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SvgPicture.asset(ImageAssets.amountTransfer),
                          ),
                          Expanded(
                            flex: 8,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(StringProvider.amountTransfer,
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
                              )),

                        ],
                      ),
                    ),
                  ),

                ),
              ),
              SizedBox(
                height: 0.05.sw,
              ),
            ],
          ),
        );
      }
    });
  }
}
