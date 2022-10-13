import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/screen_transitions.dart';
import 'package:jadu_ride_driver/presentation/screens/accounts_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/duty_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/incentives_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/more_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/partner_care_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/schedule_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';

class DashboardNav {
  DashboardNav._();

  static Route? getRoutes(
      RouteSettings routeSettings, SharedStore sharedStore) {
    var argument = _retrieveArgument(routeSettings.arguments);

    switch (routeSettings.name) {
      case AppRoute.duty:
        return ScreenTransitions.normal(DutyScreen(
          sharedStore: sharedStore,
        ));
      case AppRoute.accounts:
        return ScreenTransitions.normal(AccountsScreen(
          sharedStore: sharedStore,
        ));
      case AppRoute.incentives:
        return ScreenTransitions.normal(
            IncentivesScreen(sharedStore: sharedStore));
      case AppRoute.partnerCare:
        return ScreenTransitions.normal(
            PartnerCareScreen(sharedStore: sharedStore));
      case AppRoute.schedule:
        return ScreenTransitions.normal(
            ScheduleScreen(sharedStore: sharedStore));
      case AppRoute.more:
        return ScreenTransitions.normal(MoreScreen(sharedStore: sharedStore));
      default:
        return null;
    }
  }

  static _retrieveArgument(Object? arguments) {
    if (arguments != null) {
      if (arguments is String) {
        return arguments;
      }
    }
  }
}
