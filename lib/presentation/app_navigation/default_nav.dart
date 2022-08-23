import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/screen_transitions.dart';
import 'package:jadu_ride_driver/presentation/screens/change_app_language_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/intro_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/login_register_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/number_input_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/splash_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/verify_otp_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/welcome_jadu_ride_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';

class DefaultNav {
  DefaultNav({required this.sharedStore});
  SharedStore sharedStore;

  Route? generatedRoute(RouteSettings routeSettings) {
    var retrievedArgument = _retrieveArgument(routeSettings.arguments);

    switch (routeSettings.name) {
      case AppRoute.splash:
        return ScreenTransitions.slideTransition(
            SplashScreen(sharedStore: sharedStore));
      case AppRoute.intro:
        return ScreenTransitions.slideTransition(
            IntroScreen(sharedStore: sharedStore));
      case AppRoute.loginRegistration:
        return ScreenTransitions.slideTransition(
            LoginRegisterScreen(sharedStore: sharedStore));
      case AppRoute.numberInput:
        return ScreenTransitions.slideTransition(
            NumberInputScreen(sharedStore: sharedStore));
      case AppRoute.verifyOtp:
        return ScreenTransitions.slideTransition(VerifyOtpScreen(
            sharedStore: sharedStore, number: retrievedArgument));
      case AppRoute.changeLanguage:
        return ScreenTransitions.slideTransition(
            ChangeAppLanguageScreen(sharedStore: sharedStore)
        );
      case AppRoute.welcomeJaduRide:
        return ScreenTransitions.slideTransition(
            WelcomeJaduRideScreen(sharedStore: sharedStore)
        );
      default:
        return null;
    }
  }

  _retrieveArgument(Object? arguments) {
    if (arguments != null) {
      if (arguments is String) {
        return arguments;
      }
    }
  }
}
