import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

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

  @override
  void initState() {
    currentBalanceStore = CurrentBalanceStore();
    currentBalanceStore.datelistItem();
    //debugPrint(widget.currentBalanceKM);
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
    return Observer(
      builder: (BuildContext context) {
        if (currentBalanceStore.isLoading) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 0.18.sw,
                width: 0.18.sw,
                child: CircularProgressIndicator()),
          );
        } else {
          return ListView(
            children: [
              Column(
                children: [
                  Container(
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
                      padding: EdgeInsets.symmetric(
                          vertical: 0.05.sw, horizontal: 0.05.sw),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: StringProvider.currentBalanceDate
                                .text(AppTextStyle.currentBalanceDate),
                          ),
                          Expanded(
                              flex: 1,
                              child:
                                  SvgPicture.asset(ImageAssets.dateDownArrow))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
