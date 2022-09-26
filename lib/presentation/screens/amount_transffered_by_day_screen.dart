import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../custom_widgets/my_app_bar_without_logo.dart';
import '../stores/amount_transffered_by_day.dart';
import '../ui/app_text_style.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class AmountTransfferedbyDayScreen extends StatefulWidget {
  const AmountTransfferedbyDayScreen({Key? key}) : super(key: key);

  @override
  State<AmountTransfferedbyDayScreen> createState() => _AmountTransfferedbyDayScreenState();
}

class _AmountTransfferedbyDayScreenState extends State<AmountTransfferedbyDayScreen> {
  late final AmountTransfferedByDayStore amountTransfferedByDayStore;

  @override
  void initState() {
    amountTransfferedByDayStore = AmountTransfferedByDayStore();
    amountTransfferedByDayStore.amountTransferredListItem();
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
              StringProvider.amountTransfferedByDay.text(AppTextStyle.enterNumberStyle),
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
        if (amountTransfferedByDayStore.isLoading) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 0.10.sw,
                width: 0.10.sw,
                child: CircularProgressIndicator()),
          );
        } else {
          return amountTransfferedByDayStore.isEmpty? Center(child: Text(amountTransfferedByDayStore.msg, ),) : ListView.separated(
            padding:
            EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
            itemCount: amountTransfferedByDayStore.amountTransferredList.length,
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
          boxShadow: [
            BoxShadow(
                color: Color(0x1a000000),
                blurRadius: 20,
                spreadRadius: 0,
                offset: Offset(0, 10))
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                amountTransfferedByDayStore.amountTransferredList[index].date,
                style: TextStyle(
                    fontSize: 14.sp,
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
                        amountTransfferedByDayStore
                            .amountTransferredList[index].time,
                        style: TextStyle(
                            color: AppColors.lightGrays, fontSize: 14.sp)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "₹${amountTransfferedByDayStore.amountTransferredList[index].price}",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.lightGrays,
                      fontWeight: FontWeight.w500),
                ),
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
