import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/custom_radio_button.dart';
import '../../core/common/dialog_state.dart';
import '../../core/common/payment_summery_radio_button.dart';
import '../../utills/app_date_picker.dart';
import '../custom_widgets/my_app_bar_without_logo.dart';
import '../stores/payment_summery_view_model.dart';
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
  late final PaymentSummaryStores paymentSummaryStores;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    paymentSummaryStores = PaymentSummaryStores();
    paymentSummaryStores.currentDate();
    paymentSummaryStores.datelistItem();
    super.initState();
    _disposers = [
      reaction((p0) => paymentSummaryStores.dialogManager.datePickerState,
          (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          AppDatePicker.show(context, DateTime.now(), DateTime(2000),
              DateTime(2050), paymentSummaryStores.onSelectDate,
              dismissed: paymentSummaryStores.dialogManager.closeDatePicker);
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
    return Column(
      children: [
        Expanded(
              flex: 3,
              child:
              Column(
                children: [
                  Observer(builder: (BuildContext context){
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: DriverTransactionPaymentSummeryType
                                    .online,
                                groupValue: paymentSummaryStores.selected,
                                onChanged:
                                paymentSummaryStores.onRadioSelected,
                                activeColor: Colors.green,
                              ),
                              const Text(
                                "Online",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Colors.green),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value:
                                DriverTransactionPaymentSummeryType.cash,
                                groupValue: paymentSummaryStores.selected,
                                onChanged:
                                paymentSummaryStores.onRadioSelected,
                                activeColor: Colors.red,
                              ),
                              const Text("Cash",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.red))
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                  SizedBox(
                    height: 0.03.sw,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                    child: InkWell(
                      onTap: paymentSummaryStores.openDatePicker,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(color: AppColors.appGreens),
                            boxShadow: const [
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
                                flex: 8,
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Observer(
                                          builder: (BuildContext context) {
                                            return Text(
                                                paymentSummaryStores
                                                    .finalCurrentDate,
                                                style: TextStyle(
                                                    color: AppColors
                                                        .secondaryVariant,
                                                    fontSize: 16.sp));
                                          })
                                      /**/
                                    ],
                                  ),
                                ),
                              ),
                              const Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.date_range,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        Expanded(
            flex: 10,
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.02.sw),
                child: Observer(builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 0.02.sw, horizontal: 0.02.sw),
                    child: paymentSummaryStores
                        .datesSelectedListLoader
                        ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          height: 0.10.sh,
                          width: 0.10.sh,
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.05.sw,
                                  horizontal: 0.05.sw),
                              child:
                              const CircularProgressIndicator())),
                    )
                        : ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          vertical: 0.02.sw,
                          horizontal: 0.02.sw),
                      itemCount: paymentSummaryStores
                          .pamentSummeryArrayList.length,
                      itemBuilder: (context, index) =>
                          listItem(index),
                      separatorBuilder:
                          (BuildContext context, int index) =>
                          separatedBox(),
                    ),
                  );
                }),
              ),
            ),),
        ],
      );
  }

  Widget listItem(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0.02.sw,
      ),
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
        padding: EdgeInsets.symmetric(vertical: 0.03.sw, horizontal: 0.03.sw),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 5,
                    child: Text(
                        paymentSummaryStores
                            .pamentSummeryArrayList[index].date,
                        style: TextStyle(
                            color: AppColors.lightBlack,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,)),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            paymentSummaryStores
                                .pamentSummeryArrayList[index].paymentMethodType,
                            style: TextStyle(
                                color: AppColors.primaryVariant,
                                fontSize: 13.sp,)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                      "₹${paymentSummaryStores.pamentSummeryArrayList[index].price}",
                      style: TextStyle(
                          color: AppColors.lightGrays,
                          fontSize: 13.sp,)),
                )
              ],
            ),
            Divider(color: AppColors.deviderColor, ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(StringProvider.customarName,
                      style: TextStyle(
                        color: AppColors.lightBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(paymentSummaryStores.pamentSummeryArrayList[index].customerName,
                      style: TextStyle(
                        color: AppColors.lightGrays,
                        fontSize: 13.sp,)),
                )
              ],
            ),
            Divider(color: AppColors.deviderColor, ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(StringProvider.customarBookingId,
                      style: TextStyle(
                        color: AppColors.lightBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,)),
                ),
                Expanded(
                  flex: 2,
                  child: Text(paymentSummaryStores.pamentSummeryArrayList[index].bookingId,
                      style: TextStyle(
                        color: AppColors.lightGrays,
                        fontSize: 13.sp,)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget separatedBox() {
    return SizedBox(
      height: 0.03.sw,
    );
  }
}
