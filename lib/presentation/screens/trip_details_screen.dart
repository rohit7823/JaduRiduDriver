import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/dialog_state.dart';
import '../../core/common/payment_summery_radio_button.dart';
import '../../utills/app_date_picker.dart';
import '../custom_widgets/my_app_bar_without_logo.dart';
import '../stores/trips_details_view_model.dart';
import '../ui/app_text_style.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  late final TripsDetailsStore _stores;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _stores = TripsDetailsStore();
   _stores.currentDate();
    //_stores.tripslistItem();
    super.initState();
    _disposers = [
      reaction((p0) => _stores.dialogManager.datePickerState,
              (p0) {
            if (p0 is DialogState && p0 == DialogState.displaying) {
              AppDatePicker.show(context, DateTime.now(), DateTime(2000),
                  DateTime(2050), _stores.onSelectDate,
                  dismissed: _stores.dialogManager.closeDatePicker);
            }
          })
    ];
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
              StringProvider.tripsTxt.text(AppTextStyle.enterNumberStyle),
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
                        child: GestureDetector(
                          onTap: (){
                            _stores.onRadioSelected(DriverTransactionPaymentSummeryType
                                .online);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value: DriverTransactionPaymentSummeryType
                                    .online,
                                groupValue: _stores.selected,
                                onChanged:
                                _stores.onRadioSelected,
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
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            _stores.onRadioSelected(DriverTransactionPaymentSummeryType.cash);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Radio(
                                value:
                                DriverTransactionPaymentSummeryType.cash,
                                groupValue: _stores.selected,
                                onChanged:
                                _stores.onRadioSelected,
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
                    onTap: _stores.openDatePicker,
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
                                              _stores
                                                  .finalCurrentDate,
                                              style: TextStyle(
                                                  color: AppColors
                                                      .secondaryVariant,
                                                  fontSize: 16.sp));
                                        })

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
                  child: _stores
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
                    itemCount: _stores
                        .tripDetailsArrayList.length,
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
                  flex: 3,
                  child: Text(
                      _stores
                          .tripDetailsArrayList[index].date,
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                              _stores.tripDetailsArrayList[index].paymentType,
                              style: TextStyle(
                              color: AppColors.tripsPaymentTxtColor,
                              fontSize: 13.sp)),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        "₹${_stores.tripDetailsArrayList[index].farePrice}",
                        style: TextStyle(
                          color: AppColors.lightGrays,
                          fontSize: 13.sp,)),
                  ),
                )
              ],
            ),
            Divider(color: AppColors.deviderColor, ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 0.02.sw,
                    height: 0.02.sw,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                            shape: BoxShape.circle,
                      ),

                  ),
                ),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.03.sw),
                      child: Text(StringProvider.from,
                          style: TextStyle(
                            color: AppColors.lightGrays,
                            fontSize: 13.sp,)),
                    ),),
                Expanded(
                  flex: 9,
                  child: Text(_stores.tripDetailsArrayList[index].sourceAddress,
                      style: TextStyle(
                        color: AppColors.lightGrays,
                        fontSize: 13.sp,)),
                )
              ],
            ),
            Divider(color: AppColors.deviderColor, ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 0.02.sw,
                    height: 0.02.sw,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),

                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 0.03.sw),
                    child: Text(StringProvider.to,
                        style: TextStyle(
                          color: AppColors.lightGrays,
                          fontSize: 13.sp,)),
                  ),),
                Expanded(
                  flex: 9,
                  child: Text(_stores.tripDetailsArrayList[index].destinationAddress,
                      style: TextStyle(
                        color: AppColors.lightGrays,
                        fontSize: 13.sp,)),
                )
              ],
            ),
            Divider(color: AppColors.deviderColor, ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(StringProvider.tripId,
                      style: TextStyle(
                        color: AppColors.lightBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,)),
                ),
                Expanded(
                  flex: 5,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(_stores.tripDetailsArrayList[index].id,
                        style: TextStyle(
                          color: AppColors.lightBlack,
                          fontSize: 12.sp,)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(_stores.tripDetailsArrayList[index].time,
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
