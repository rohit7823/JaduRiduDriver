import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../stores/schedule_view_model.dart';
import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class ScheduleScreen extends StatefulWidget {
  final SharedStore sharedStore;

  const ScheduleScreen({Key? key, required this.sharedStore}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late final ScheduleStore scheduleStore;

  @override
  void initState() {
    scheduleStore = ScheduleStore();
    scheduleStore.schedulelistItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            expand(flex: 2, child: _upperSideContent()),
            expand(flex: 8, child: _lowerSideContent()),
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
              StringProvider.scheduleTrip.text(AppTextStyle.enterNumberStyle),
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
          flex: 10,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.02.sw),
              child: Observer(builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.02.sw, horizontal: 0.02.sw),
                  child: scheduleStore.isLoading
                      ? Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              height: 0.10.sh,
                              width: 0.10.sh,
                              child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 0.05.sw, horizontal: 0.05.sw),
                                  child: const CircularProgressIndicator())),
                        )
                      : scheduleStore.isEmpty? Center(child: Text(scheduleStore.msg, ),): ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 0.02.sw, horizontal: 0.02.sw),
                          itemCount: scheduleStore.scheduleArrayList.length,
                          itemBuilder: (context, index) => listItem(index),
                          separatorBuilder: (BuildContext context, int index) =>
                              separatedBox(),
                        ),
                );
              }),
            ),
          ),
        ),
      ],
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
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.03.sw, horizontal: 0.03.sw),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(scheduleStore.scheduleArrayList[index].date,
                      style: TextStyle(
                        color: AppColors.lightBlack,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      )),
                ),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.sp),
                    child: Text("TIME:",
                            style: TextStyle(
                              color: AppColors.primaryVariant,
                              fontSize: 13.sp,
                            )),

                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(scheduleStore.scheduleArrayList[index].time,
                      style: TextStyle(
                        color: AppColors.lightGrays,
                        fontSize: 13.sp,
                      )).paddings(vertical: 0.01.sw, horizontal: 0.01.sw),
                )
              ],
            ),
            Divider(
              color: AppColors.deviderColor,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(StringProvider.pickUpLocation,
                              style: TextStyle(
                                color: AppColors.primaryVariant,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              scheduleStore
                                  .scheduleArrayList[index].pickUpLocation,
                              style: TextStyle(
                                color: AppColors.lightGrays,
                                fontSize: 13.sp,
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0.02.sh),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(StringProvider.dropLocation,
                                style: TextStyle(
                                  color: AppColors.appGreen,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                              scheduleStore
                                  .scheduleArrayList[index].dropLocation,
                              style: TextStyle(
                                color: AppColors.lightGrays,
                                fontSize: 13.sp,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),

                //  Expanded(
                  //   flex: 3,
                  //   child: Align(
                  //     alignment: Alignment.center,
                  //     child: Column(
                  //       children: [
                  //         Icon(
                  //           size: 60,
                  //           Icons.navigation,
                  //           color: AppColors.secondaryVariant,
                  //         ),
                  //         Text(StringProvider.navigatesTxt,
                  //             style: TextStyle(
                  //               color: AppColors.secondaryVariant,
                  //               fontSize: 14.sp,
                  //               fontWeight: FontWeight.w600,
                  //             )),
                  //       ],
                  //     ),
                  //   ),
                  // ),
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
