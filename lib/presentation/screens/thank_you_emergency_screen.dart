import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/change_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/app_text_style.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

class ThankYouEmergencyScreen extends StatefulWidget {
  const ThankYouEmergencyScreen({Key? key}) : super(key: key);

  @override
  State<ThankYouEmergencyScreen> createState() =>
      _ThankYouEmergencyScreenState();
}

class _ThankYouEmergencyScreenState extends State<ThankYouEmergencyScreen> {
  late final AppNavigator _navigator;
  late final List<ReactionDisposer> _disposers;

  @override
  void initState() {
    _navigator = AppNavigator();
    super.initState();
    _disposers = [
      reaction((p0) => _navigator.currentChange, (p0) {
        if (p0 != null) {
          ChangeScreen.to(
            context,
            p0.screen,
            onComplete: _navigator.clear,
            option: p0.option,
            arguments: p0.argument,
          );
        }
      })
    ];
  }

  @override
  void dispose() {
    for (var element in _disposers) {
      element();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _navigator.onChange(ScreenWithExtras(
            screen: Screen.dashBoard,
            option: NavigationOption(option: Option.popAll)));
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            expand(
                flex: 8,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        ImageAssets.emergencyComplete,
                        width: .30.sw,
                        height: .30.sw,
                      ).paddings(vertical: 0.05.sw),
                      StringProvider.thankYou.text(AppTextStyle.profileText
                          .copyWith(fontWeight: FontWeight.w600)),
                      StringProvider.youWllGetYourPaymentShortly
                          .text(AppTextStyle.packageBtnStyle)
                    ],
                  ),
                )),
            expand(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 55,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(AppColors.primary),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder())),
                        onPressed: () {
                          _navigator.onChange(ScreenWithExtras(
                              screen: Screen.dashBoard,
                              option: NavigationOption(option: Option.popAll)));
                        },
                        child: Text(
                          StringProvider.proceed,
                          style: AppTextStyle.btnTextStyleWhite,
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
