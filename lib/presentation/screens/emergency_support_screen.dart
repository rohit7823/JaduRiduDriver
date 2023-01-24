import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../custom_widgets/my_app_bar_without_logo.dart';
import '../stores/emergency_support_view_model.dart';
import '../ui/app_button_themes.dart';
import '../ui/app_text_style.dart';
import '../ui/string_provider.dart';
import '../ui/theme.dart';

class EmergencyScreen extends StatefulWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  late final EmergencyStore emergencyStore;

  @override
  void initState() {
    emergencyStore = EmergencyStore();
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
              StringProvider.emergencyTxt.text(AppTextStyle.enterNumberStyle),
              StringProvider.emergencySupportDescription
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
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.05.sw, horizontal: 0.05.sw),
        child: Container(
          height: 0.30.sh,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              border: Border.all(color: AppColors.appGreens),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x1a000000),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 10))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StringProvider.tollFreeMobileNumber
                  .text(AppTextStyle.tollFreeMobileStyle),
              Observer(builder: (BuildContext context) {
                return emergencyStore.helpPhoneNumber
                    .text(AppTextStyle.helpMobileStyle);
                //}
              }),
              Padding(
                padding: EdgeInsets.only(
                    left: 0.15.sw,
                    right: 0.15.sw,
                    top: 0.05.sw,
                    bottom: 0.05.sw),
                child: ElevatedButton(
                  onPressed: () => launchUrl(
                      Uri.parse("tel:${emergencyStore.helpPhoneNumber}")),
                  //${helpStore.helpPhoneNumber
                  style: AppButtonThemes.defaultStyle.copyWith(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryVariant)),
                  child: StringProvider.callNowTxt
                      .text(AppTextStyle.helpNumberTxt),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
