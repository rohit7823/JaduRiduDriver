import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../custom_widgets/my_app_bar_without_logo.dart';
import '../custom_widgets/outline_drop_down.dart';
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

  @override
  void initState() {
    currentBalanceStore = CurrentBalanceStore();
    currentBalanceStore.allDatelistItem();
    super.initState();
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
          padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
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
    // Default Radio Button Selected Item When App Starts.
    //String radioButtonItem = 'ONE';

    // Group Value for Radio Button.
    int id = 1;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  //radioButtonItem = 'TWO';
                  id = 1;
                });
              },
            ),
            Text(
              'Received',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),
            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  //radioButtonItem = 'THREE';
                  id = 2;
                });
              },
            ),
            Text(
              'Paid',
              style: new TextStyle(fontSize: 17.0),
            ),
          ],
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
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
                            vertical: 0.02.sw, horizontal: 0.02.sw),
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

/*Expanded(
flex: 8,
child: Observer(builder: (BuildContext context) {
return Padding(
padding: EdgeInsets.symmetric(
vertical: 0.02.sw, horizontal: 0.02.sw),
child: currentBalanceStore.datesSelectedListLoader
? Align(
alignment: Alignment.center,
child: SizedBox(
height: 0.10.sw,
width: 0.10.sw,
child: CircularProgressIndicator()),
)
    : ListView.separated(
shrinkWrap: true,
padding: EdgeInsets.symmetric(
vertical: 0.02.sw, horizontal: 0.02.sw),
itemCount:
currentBalanceStore.currentBalanceList.length,
itemBuilder: (context, index) => listItem(index),
separatorBuilder: (BuildContext context, int index) =>
separatedBox(),
),
);
}))*/
