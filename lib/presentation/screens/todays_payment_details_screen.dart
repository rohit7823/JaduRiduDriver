import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/core/common/payment_method.dart';
import 'package:jadu_ride_driver/presentation/stores/todays_payment_view_model.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../custom_widgets/my_app_bar_without_logo.dart';
import '../ui/app_text_style.dart';
import '../ui/image_assets.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class TodaysPaymentDetails extends StatefulWidget {
  const TodaysPaymentDetails({Key? key}) : super(key: key);

  @override
  State<TodaysPaymentDetails> createState() => _TodaysPaymentDetailsState();
}

class _TodaysPaymentDetailsState extends State<TodaysPaymentDetails> {
  late final TodaysPaymentss todaysPaymentViewModel;

  @override
  void initState() {
    todaysPaymentViewModel = TodaysPaymentss();
    todaysPaymentViewModel.todaysPaymentListItem();
    super.initState();
  }

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
              StringProvider.todaysPayments.text(AppTextStyle.enterNumberStyle),
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
    return Observer(
      builder: (BuildContext context) {
        if (todaysPaymentViewModel.isLoading) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 0.10.sw,
                width: 0.10.sw,
                child: CircularProgressIndicator()),
          );
        } else {

          return todaysPaymentViewModel.todaysPaymentList.isEmpty ?
          Center(child: Text("Doesn't have any Payment ",
            style: TextStyle(fontSize: 25.sp, color: AppColors.refer ),),)
              :  ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
            itemCount: todaysPaymentViewModel.todaysPaymentList.length,
            itemBuilder: (context, index) => listItem(index),
            separatorBuilder: (BuildContext context, int index) =>
                separatedBox(),
          );
        }
      },
    );
  }

  Widget listItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          border: Border.all(color: AppColors.appGreens),
          boxShadow: const [
            BoxShadow(
                color: Color(0x1a000000),
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, 0))
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                todaysPaymentViewModel.todaysPaymentList[index].transationAt,
                style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.lightGrays,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        todaysPaymentViewModel.todaysPaymentList[index].paymentMode,

                        style:  todaysPaymentViewModel.todaysPaymentList[index].paymentMode == PaymentMethod.online.value? TextStyle(
                            color: AppColors.appGreen, fontSize: 14.sp) :TextStyle(
                  color: AppColors.primaryVariant, fontSize: 14.sp)),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "₹${todaysPaymentViewModel.todaysPaymentList[index].amount}",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.lightGrays,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget separatedBox() {
    return SizedBox(
      height: 0.05.sw,
    );
  }
}
