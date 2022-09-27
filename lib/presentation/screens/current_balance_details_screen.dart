import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';
import '../../core/common/custom_radio_button.dart';
import '../../core/common/dialog_state.dart';
import '../../utills/app_date_picker.dart';
import '../custom_widgets/my_app_bar_without_logo.dart';
import '../stores/current_balance_view_model.dart';
import '../ui/app_button_themes.dart';
import '../ui/app_text_style.dart';
import '../ui/image_assets.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class CurrentBalanceDetailsScreen extends StatefulWidget {
  CurrentBalanceDetailsScreen({Key? key, required this.currentBalanceKM})
      : super(key: key);

  String currentBalanceKM;

  @override
  State<CurrentBalanceDetailsScreen> createState() =>
      _CurrentBalanceDetailsScreenState();
}

class _CurrentBalanceDetailsScreenState
    extends State<CurrentBalanceDetailsScreen> {
  late final CurrentBalanceStore currentBalanceStore;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    currentBalanceStore = CurrentBalanceStore();
    currentBalanceStore.allDatelistItem();
    currentBalanceStore.currentDate();
    super.initState();

    _disposers = [
      reaction((p0) => currentBalanceStore.dialogManager.datePickerState, (p0) {
        if (p0 is DialogState && p0 == DialogState.displaying) {
          AppDatePicker.show(context, DateTime.now(), DateTime(2000),
              DateTime(2050), currentBalanceStore.onSelectDate,
              dismissed: currentBalanceStore.dialogManager.closeDatePicker);
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
            expand(flex: 3, child: _upperSideContent()),
            expand(flex: 7, child: _lowerSideContent())
          ],
        ),
      ),
    );
  }

  Widget _upperSideContent() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(color: AppColors.primary),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 8,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.05.sw, horizontal: 0.05.sw),
                            child: fitBox(
                              child: Column(
                                children: [
                                  StringProvider.currentBalanceTitle
                                      .text(AppTextStyle.currentBalanceTitle),
                                  Row(
                                    children: [
                                      widget.currentBalanceKM.text(
                                          AppTextStyle.currentBalanceDetails),
                                      StringProvider.currentBalanceKM_TXT.text(
                                          AppTextStyle.currentBalanceDetailsKM),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.03.sw, horizontal: 0.05.sw),
                          child: fitBox(
                              child: SvgPicture.asset(ImageAssets.balanceCar)),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: AppColors.white,
                ))
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.20.sw),
          child: ElevatedButton(
            onPressed: () {},
            style: AppButtonThemes.defaultStyle.copyWith(
                backgroundColor:
                    MaterialStateProperty.all(AppColors.primaryVariant)),
            child:
                StringProvider.rechargeNow.text(AppTextStyle.partnerButtonTxt),
          ),
        ),
      ],
    );
  }

  Widget _lowerSideContent() {
    return Container(
      child: Column(
        children: [
          Observer(
            builder: (BuildContext context) {
              return Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                  child: Column(
                    children: [
                      Row(

                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: DriverTransactionType.received,
                                  groupValue: currentBalanceStore.selected,
                                  onChanged:
                                      currentBalanceStore.onRadioSelected,
                                  activeColor: Colors.green,
                                ),
                                Text(
                                  "Received",
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
                                  value: DriverTransactionType.paid,
                                  groupValue: currentBalanceStore.selected,
                                  onChanged:
                                      currentBalanceStore.onRadioSelected,
                                  activeColor: Colors.red,
                                ),
                                Text("Paid",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: Colors.red))
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.03.sw,
                      ),
                      InkWell(
                        onTap: currentBalanceStore.openDatePicker,
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
                                  flex: 8,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Observer(builder: (BuildContext context) {
                                          return Text(
                                              currentBalanceStore
                                                  .finalCurrentDate,
                                              style: TextStyle(
                                                  color:
                                                      AppColors.secondaryVariant,
                                                  fontSize: 16.sp));
                                        })
                                        /**/
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Icon(
                                      Icons.date_range,
                                      color: Colors.red,
                                    )

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.02.sw),
                          child: Observer(builder: (BuildContext context) {
                            return currentBalanceStore.datesSelectedListLoader? Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 0.15.sw),
                                        child: SizedBox(
                                            height: 0.10.sh,
                                            width: 0.10.sh,
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
                                                child: const CircularProgressIndicator())),
                                      ),
                                    )
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 0.02.sw,
                                          horizontal: 0.02.sw),
                                      itemCount: currentBalanceStore
                                          .currentBalanceList.length,
                                      itemBuilder: (context, index) =>
                                          listItem(index),
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              separatedBox(),
                                    );
                            //);
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0.02.sw,
      ),
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.03.sw),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                              vertical: 0.01.sw, horizontal: 0.01.sw),
                          child: Column(
                            children: [
                              Text("27",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.appGreery,
                                      fontWeight: FontWeight.w500)),
                              Text("June",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.appGreery,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                flex: 7,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentBalanceStore.currentBalanceList[index].title,
                          style: TextStyle(
                              color: AppColors.lightBlack,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500)),
                      Text(
                        currentBalanceStore.currentBalanceList[index].sub_title,
                        style: TextStyle(
                            color: AppColors.appGreery, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                    "₹${currentBalanceStore.currentBalanceList[index].price}",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget separatedBox() {
    return SizedBox(
      height: 0.03.sw,
    );
  }
}
