import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/presentation/stores/incentive_view_model.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../ui/app_text_style.dart';
import '../ui/theme.dart';

class IncentivesScreen extends StatefulWidget {
  final SharedStore sharedStore;

  const IncentivesScreen({Key? key, required this.sharedStore})
      : super(key: key);

  @override
  State<IncentivesScreen> createState() => _IncentivesScreenState();
}

class _IncentivesScreenState extends State<IncentivesScreen> {
  late final IncentivesStore incentivesStore;

  @override
  void initState() {
    incentivesStore = IncentivesStore();
    incentivesStore.listItem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              StringProvider.incentives.text(AppTextStyle.enterNumberStyle),
              StringProvider.incentivesDescription
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
        if (incentivesStore.isLoading) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 0.18.sw,
                width: 0.18.sw,
                child: CircularProgressIndicator()),
          );
        } else {
          return ListView.separated(
            padding:
                EdgeInsets.symmetric(vertical: 0.04.sw, horizontal: 0.04.sw),
            itemCount: incentivesStore.incentiveList.length,
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
      padding: EdgeInsets.symmetric(
        vertical: 0.05.sw,
      ),
      //margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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

      child: Column(

        children: [
          ListTile(
            title: Text(incentivesStore.incentiveList[index].heading,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(
              incentivesStore.incentiveList[index].body,
              style: TextStyle(color: Colors.grey, fontSize: 15.sp),
            ),
            trailing: Text(
                "₹${incentivesStore.incentiveList[index].amount}",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget separatedBox() {
    return SizedBox(
      height: 0.05.sw,
    );
  }
}
