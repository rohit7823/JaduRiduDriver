import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';

import '../screens/dashboard_screen.dart';

class ChangeScreen {
  static GlobalKey<NavigatorState>? dashBoardNavigator;
  static GlobalKey<NavigatorState> mainNavigator;

  ChangeScreen();

  initNestedNavKey(GlobalKey<NavigatorState> key) {
    dashBoardNavigator = key;
  }

  to(BuildContext context, Screen screen,
      {Function? onComplete,
      Object? arguments,
      Function(Object)? fromScreen,
      NavigationOption? option}) async {
    switch (screen) {
      case Screen.none:
        debugPrint("changeScreen: there is nothing");
        break;
      case Screen.splash:
        await _navigate(context, AppRoute.splash,
            onComplete: onComplete, arguments: arguments);
        break;
      case Screen.introScreen:
        await _navigateWithOption(AppRoute.intro, option!,
            onComplete: onComplete, arguments: arguments);
        break;
      case Screen.loginRegistrationScreen:
        await _navigate(context, AppRoute.loginRegistration,
            onComplete: onComplete, arguments: arguments);
        break;
      case Screen.numberInputScreen:
        await _navigateWithOption(AppRoute.numberInput, option!,
            onComplete: onComplete);
        break;
      case Screen.verifyOtp:
        await _navigateWithOption(
            AppRoute.verifyOtp,
            arguments: arguments,
            option!,
            onComplete: onComplete);
        break;
      case Screen.changeLanguage:
        await _navigateWithOption(AppRoute.changeLanguage, option!,
            arguments: arguments, onComplete: onComplete);
        break;
      case Screen.welcomeJaduRide:
        await _navigate(context, AppRoute.welcomeJaduRide,
            arguments: arguments, onComplete: onComplete);
        break;
      case Screen.addVehicle:
        await _navigate(context, AppRoute.addVehicle,
            arguments: arguments, onComplete: onComplete);
        break;
      case Screen.addAllDetails:
        await _navigate(context, AppRoute.allDetails,
            arguments: arguments, onComplete: onComplete);
        break;
      case Screen.identifyDetails:
        _navigate(context, AppRoute.identifyDetails,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.vehicleAudit:
        _navigate(context, AppRoute.vehicleAudit,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.vehiclePermit:
        _navigate(context, AppRoute.vehiclePermit,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.panCard:
        _navigate(context, AppRoute.panCard,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.vehicleInsurance:
        _navigate(context, AppRoute.vehicleInsurance,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.registrationCertificate:
        _navigate(context, AppRoute.registrationCertificate,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.profilePicture:
        _navigate(context, AppRoute.profilePicture,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.aadharCard:
        _navigate(context, AppRoute.aadharCard,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.driverLicense:
        _navigate(context, AppRoute.driverLicense,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.paymentDetails:
        _navigate(context, AppRoute.paymentDetails,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.applicationSubmitted:
        _navigateWithOption(AppRoute.applicationSubmitted, option!,
            arguments: arguments, onComplete: onComplete);
        break;
      case Screen.vehiclePollution:
        _navigate(context, AppRoute.vehiclePollution,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.dashBoard:
        if (option != null) {
          _navigateWithOption(AppRoute.dashBoard, option);
        }
        break;

      case Screen.currentBalanceDetails:
        _navigate(
          context,
          AppRoute.currentBalance,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.profileDetailsScreen:
        _navigate(
          context,
          AppRoute.profileDetails,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.todaysPaymentScreen:
        _navigate(
          context,
          AppRoute.todaysPayment,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.referScreen:
        _navigate(
          context,
          AppRoute.referScreen,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.termsAndConditionsScreen:
        _navigate(
          context,
          AppRoute.termsAndConditionsScreen,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.privacyPolicyScreen:
        _navigate(
          context,
          AppRoute.privacyPolicyScreen,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.refundPolicyScreen:
        _navigate(
          context,
          AppRoute.refundPolicyScreen,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;

      case Screen.helpScreen:
        _navigate(
          context,
          AppRoute.helpScreen,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;

      case Screen.emergencySupportScreen:
        _navigate(
          context,
          AppRoute.emergencySupportScreen,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;

      case Screen.tripsScreen:
        _navigate(
          context,
          AppRoute.tripsScreen,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;

      case Screen.paymentSummeryScreen:
        _navigate(
          context,
          AppRoute.paymentSummery,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.amountTransfferedByDayScreen:
        _navigate(
          context,
          AppRoute.amountTransfferedByDay,
          arguments: arguments,
          onComplete: onComplete,
        );
        break;
      case Screen.rideNavigation:
        debugPrint("screen: rideNavigation argument: $arguments");
        _navigate(context, AppRoute.rideNavigation,
            arguments: arguments, onComplete: onComplete);
        break;
      case Screen.verifyTripOtp:
        _navigate(context, AppRoute.verifyTripOtp,
            arguments: arguments,
            onComplete: onComplete,
            fromScreen: fromScreen);
        break;
      case Screen.payTrip:
        _navigateWithOption(
            AppRoute.payTrip,
            arguments: arguments,
            option!,
            onComplete: onComplete);
        break;
      case Screen.rateCustomer:
        _navigateWithOption(
            AppRoute.rateCustomer,
            arguments: arguments,
            option!,
            onComplete: onComplete);
        break;
    }
  }

  nestedTo(Screen screen,
      {Function? onComplete,
      Object? arguments,
      Function(Object)? fromScreen,
      NavigationOption? option}) async {
    switch (screen) {
      case Screen.duty:
        _nestedNavigateWithOption(AppRoute.duty, option!);
        break;
      case Screen.accounts:
        _nestedNavigateWithOption(AppRoute.accounts, option!);
        break;
      case Screen.incentives:
        _nestedNavigateWithOption(AppRoute.incentives, option!);
        break;
      case Screen.partnerCare:
        _nestedNavigateWithOption(AppRoute.partnerCare, option!);
        break;
      case Screen.schedule:
        _nestedNavigateWithOption(AppRoute.schedule, option!);
        break;
      case Screen.more:
        _nestedNavigateWithOption(AppRoute.more, option!);
        break;
    }

    onComplete?.call();
  }

  _navigate(BuildContext context, String destination,
      {Function? onComplete,
      Object? arguments,
      Function(Object)? fromScreen}) async {
    var returnedValue = await mainNavigator.currentState
        ?.pushNamed(destination, arguments: arguments);

    if (returnedValue != null) {
      fromScreen?.call(returnedValue);
    }

    onComplete?.call();
  }

  _navigateWithOption(String destination, NavigationOption option,
      {Function? onComplete, Object? arguments}) async {
    switch (option.option) {
      case Option.popPrevious:
        await mainNavigator.currentState
            ?.popAndPushNamed(destination, arguments: arguments);
        break;
      case Option.popAll:
        await mainNavigator.currentState
            ?.pushNamedAndRemoveUntil(destination, (route) => false);
        break;
      default:
        await mainNavigator.currentState
            ?.pushNamed(destination, arguments: arguments);
    }
    onComplete?.call();
  }

  _nestedNavigateWithOption(String destination, NavigationOption option,
      {Function? onComplete, Object? arguments}) async {
    switch (option.option) {
      case Option.popPrevious:
        await navKey.currentState
            ?.popAndPushNamed(destination, arguments: arguments);
        break;
      case Option.popAll:
        await navKey.currentState
            ?.pushNamedAndRemoveUntil(destination, (route) => false);
        break;
      default:
        await navKey.currentState?.pushNamed(destination, arguments: arguments);
    }
    onComplete?.call();
  }

  _navigatePop(BuildContext context, [Object? result]) async {
    mainNavigator.currentState?.pop(result);
  }

  from(BuildContext context, Screen dest,
      {Function? onCompleted, Object? result}) {
    if (dest == Screen.addAllDetails) {
      _navigatePop(context, result);
    } else if (dest == Screen.vehicleAudit) {
      _navigatePop(context, result);
    } else if (dest == Screen.dashBoard) {
      _navigatePop(context, result);
    } else if (dest == Screen.rideNavigation) {
      _navigatePop(context, result);
    } else if (dest == Screen.rateCustomer) {
      _navigatePop(context, result);
    }
    onCompleted?.call();
  }
}
