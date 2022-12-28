import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/my_app_bar_without_logo.dart';
import 'package:jadu_ride_driver/presentation/stores/notification_view_model.dart';
import 'package:jadu_ride_driver/presentation/ui/app_button_themes.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late final NotificationStore notificationStore;

  @override
  void initState() {
    notificationStore = NotificationStore();
    notificationStore.getNotificationData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBarWithOutLogo(),
      body: SafeArea(
        child: Column(
          children: [
            expand(flex: 1, child: _upperSideContent()),
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
              StringProvider.notification.text(AppTextStyle.enterNumberStyle),
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
          flex: 5,
          child: Observer(builder: (BuildContext context) {
            if (notificationStore.isLoading) {
              return Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: 0.10.sw,
                    width: 0.10.sw,
                    child: CircularProgressIndicator()),
              );
            } else {
              return notificationStore.isEmpty
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Icon(Icons.notifications,size: 0.30.sw,color:AppColors.appGreens,),
                         Text("No New Notification",style: TextStyle(fontSize: 25.sp, color: AppColors.refer ),),
                         Padding(
                           padding: EdgeInsets.symmetric(horizontal: 0.08.sw),
                           child:  Text("Check this space for updates, reminders & \n           messages from partner care",style: TextStyle(fontSize: 15.sp,color: AppColors.refer),),
                         ),
                       ],
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                          vertical: 0.02.sw, horizontal: 0.02.sw),
                      itemCount: notificationStore.NList.length,
                      itemBuilder: (context, index) => listItem(index),
                      separatorBuilder: (BuildContext context, int index) =>
                          separatedBox(),
                    );
            }
          }),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 0.02.sw),
          child: expand(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: AppButtonThemes.backBtnStyle.copyWith(
                      fixedSize: MaterialStatePropertyAll(Size(0.90.sw, 65.h))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: StringProvider.back.text(AppTextStyle.btnTextStyleWhite
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 20.sp)),
                ),
              )),
        )
      ],
    );
  }

  Widget listItem(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.04.sw, horizontal: 0.04.sw),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Observer(
                builder: (BuildContext context) {
                  return CircleAvatar(
                    foregroundImage:
                        AssetImage(notificationStore.NList[index].imagepath),
                  );
                },
              )),
          SizedBox(width: 0.01.sw),
          Expanded(
            flex: 4,
            child: Text(
              notificationStore.NList[index].info,
              style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.lightGrays,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.01.sw),
            child: Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(top: 0.06.sw),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 15.sp,
                    ),
                    Text(notificationStore.NList[index].time,
                        style: TextStyle(
                            color: AppColors.lightGrays, fontSize: 14.sp)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget separatedBox() {
    return SizedBox(
      height: 0.02.sw,
      child: Padding(
          padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw),
          child: Divider(
            height: 0.01.sw,
            thickness: 0.01.sw,
          )),
    );
  }
}
