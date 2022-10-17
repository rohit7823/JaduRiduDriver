import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';

class ChangeScreen {
  GlobalKey<NavigatorState> dashBoardNavigator;
  ChangeScreen(this.dashBoardNavigator);

  static to(BuildContext context, Screen screen,
      {Function? onComplete,
      Object? arguments,
      Function(Object)? fromScreen,
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
        _navigateWithOption(context, AppRoute.applicationSubmitted, option!);
        break;
      case Screen.vehiclePollution:
        _navigate(context, AppRoute.vehiclePollution);
        break;
      case Screen.dashBoard:
        if (option != null) {
          _navigateWithOption(context, AppRoute.dashBoard, option);
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
            arguments: arguments, onComplete: onComplete);
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
        _navigateWithOption(
            dashBoardNavigator.currentState!.context, AppRoute.duty, option!);
        break;
      case Screen.accounts:
        _navigateWithOption(dashBoardNavigator.currentState!.context,
            AppRoute.accounts, option!);
        break;
      case Screen.incentives:
        _navigateWithOption(dashBoardNavigator.currentState!.context,
            AppRoute.incentives, option!);
        break;
      case Screen.partnerCare:
        _navigateWithOption(dashBoardNavigator.currentState!.context,
            AppRoute.partnerCare, option!);
        break;
      case Screen.schedule:
        _navigateWithOption(dashBoardNavigator.currentState!.context,
            AppRoute.schedule, option!);
        break;
      case Screen.more:
        _navigateWithOption(
            dashBoardNavigator.currentState!.context, AppRoute.more, option!);
        break;
    }

    onComplete?.call();
  }

  static _navigate(BuildContext context, String destination,
      {Function? onComplete,
      Object? arguments,
      Function(Object)? fromScreen}) async {
    var returnedValue = await Navigator.of(context)
        .pushNamed(destination, arguments: arguments);

    if (returnedValue != null) {
      fromScreen?.call(returnedValue);
    }

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
        await Navigator.of(context)
            .pushNamedAndRemoveUntil(destination, (route) => false);
        break;
    }
    onComplete?.call();
  }

  static _navigatePop(BuildContext context, [Object? result]) async {
    Navigator.of(context).pop(result);
  }

  static from(BuildContext context, Screen dest,
      {Function? onCompleted, Object? result}) {
    if (dest == Screen.addAllDetails) {
      _navigatePop(context, result);
    } else if (dest == Screen.vehicleAudit) {
      _navigatePop(context, result);
    } else if (dest == Screen.dashBoard) {
      _navigatePop(context, result);
    }

    onCompleted?.call();
  }
}
