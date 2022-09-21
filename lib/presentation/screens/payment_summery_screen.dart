import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../custom_widgets/my_app_bar_without_logo.dart';
import '../ui/app_text_style.dart';
import '../ui/image_assets.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class PaymentSummeryScreen extends StatefulWidget {
  const PaymentSummeryScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSummeryScreen> createState() => _PaymentSummeryScreenState();
}

class _PaymentSummeryScreenState extends State<PaymentSummeryScreen> {
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
              StringProvider.paymentsSummery
                  .text(AppTextStyle.enterNumberStyle),
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
    return fitBox(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                                        color: AppColors.appGreens,
                                        fontSize: 11.sp)),
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
                    Text("data")
                  ],
                ))));
  }
}
