import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';

class ChangeScreen {
  ChangeScreen._();

  static to(BuildContext context, Screen screen,
      {Function? onComplete,
      Object? arguments,
      NavigationOption? option}) async {
    switch (screen) {
      case Screen.none:
        debugPrint("changeScreen: there is nothing");
        break;
      case Screen.introScreen:
        await _navigateWithOption(context, AppRoute.intro, option!,
            onComplete: onComplete, arguments: arguments);
        break;
      case Screen.loginRegistrationScreen:
        await _navigate(context, AppRoute.loginRegistration,
            onComplete: onComplete, arguments: arguments);
        break;
      case Screen.numberInputScreen:
        await _navigateWithOption(context, AppRoute.numberInput, option!,
            onComplete: onComplete);
        break;
      case Screen.verifyOtp:
        await _navigateWithOption(
            context,
            AppRoute.verifyOtp,
            arguments: arguments,
            option!,
            onComplete: onComplete);
        break;
      case Screen.changeLanguage:
        await _navigateWithOption(context, AppRoute.changeLanguage, option!,
            onComplete: onComplete);
        break;
      case Screen.welcomeJaduRide:
        await _navigate(context, AppRoute.welcomeJaduRide, arguments: arguments, onComplete: onComplete);
        break;
    }
  }

  static _navigate(BuildContext context, String destination,
      {Function? onComplete, Object? arguments}) async {
    await Navigator.of(context).pushNamed(destination, arguments: arguments);
    onComplete?.call();
  }

  static _navigateWithOption(
      BuildContext context, String destination, NavigationOption option,
      {Function? onComplete, Object? arguments}) async {
    switch (option.option) {
      case Option.popPrevious:
        await Navigator.of(context)
            .popAndPushNamed(destination, arguments: arguments);
        break;
      case Option.popAll:
        // TODO: Handle this case.
        break;
    }
    onComplete?.call();
  }
}
