import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/app_route.dart';
import 'package:jadu_ride_driver/core/domain/ride_id.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/screen_transitions.dart';
import 'package:jadu_ride_driver/presentation/screens/aadhar_card_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/add_all_details_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/add_vehicle_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/application_submitted_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/change_app_language_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/dashboard_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/driver_license_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/indentify_details_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/intro_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/login_register_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/number_input_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/pan_card_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/payment_details_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/profile_picture_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/registration_certificate_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/ride_navigation_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/splash_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/vehicle_audit_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/vehicle_insurance_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/vehicle_permit_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/vehicle_pollution_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/verify_otp_screen.dart';
import 'package:jadu_ride_driver/presentation/screens/welcome_jadu_ride_screen.dart';
import 'package:jadu_ride_driver/presentation/stores/shared_store.dart';

import '../../core/common/profile_short_description.dart';
import '../screens/amount_transffered_by_day_screen.dart';
import '../screens/current_balance_details_screen.dart';
import '../screens/emergency_support_screen.dart';
import '../screens/help_screen.dart';
import '../screens/payment_summery_screen.dart';
import '../screens/privacy_policy_screen.dart';
import '../screens/profile_details_screen.dart';
import '../screens/refer_screen.dart';
import '../screens/refund_policy_screen.dart';
import '../screens/terms_conditions_screen.dart';
import '../screens/todays_payment_details_screen.dart';
import '../screens/trip_details_screen.dart';

class DefaultNav {
  DefaultNav({required this.sharedStore});

  SharedStore sharedStore;

  Route? generatedRoute(RouteSettings routeSettings) {
    var retrievedArgument = _retrieveArgument(routeSettings.arguments);

    debugPrint(routeSettings.name);
    switch (routeSettings.name) {
      case AppRoute.splash:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            SplashScreen(sharedStore: sharedStore));
      case AppRoute.intro:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            IntroScreen(sharedStore: sharedStore));
      case AppRoute.loginRegistration:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            LoginRegisterScreen(sharedStore: sharedStore));
      case AppRoute.numberInput:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            NumberInputScreen(sharedStore: sharedStore));
      case AppRoute.verifyOtp:
        return ScreenTransitions.rightToLeftTransitionWithEvent(VerifyOtpScreen(
            sharedStore: sharedStore, number: retrievedArgument));
      case AppRoute.changeLanguage:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            ChangeAppLanguageScreen(sharedStore: sharedStore));
      case AppRoute.welcomeJaduRide:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            WelcomeJaduRideScreen(sharedStore: sharedStore));
      case AppRoute.addVehicle:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            AddVechicleScreen(sharedStore: sharedStore));
      case AppRoute.allDetails:
        return ScreenTransitions.rightToLeftTransition(
            AddAllDetailsScreen(sharedStore: sharedStore));
      case AppRoute.identifyDetails:
        return ScreenTransitions.bottomToTopTransition(
            const IdentifyDetailsScreen());
      case AppRoute.vehicleAudit:
        return ScreenTransitions.bottomToTopTransition(
            const VehicleAuditScreen());
      case AppRoute.vehiclePermit:
        return ScreenTransitions.bottomToTopTransition(
            const VehiclePermitScreen());
      case AppRoute.panCard:
        return ScreenTransitions.bottomToTopTransition(const PancardScreen());
      case AppRoute.vehicleInsurance:
        return ScreenTransitions.bottomToTopTransition(
            const VehicleInsuranceScreen());
      case AppRoute.registrationCertificate:
        return ScreenTransitions.bottomToTopTransition(
            const RegistrationCertificationScreen());
      case AppRoute.profilePicture:
        return ScreenTransitions.bottomToTopTransition(
            const ProfilePictureScreen());
      case AppRoute.aadharCard:
        return ScreenTransitions.bottomToTopTransition(
            const AadharCardScreen());
      case AppRoute.driverLicense:
        return ScreenTransitions.bottomToTopTransition(
            const DriverLicenseScreen());
      case AppRoute.paymentDetails:
        return ScreenTransitions.bottomToTopTransition(
            const PaymentDetailsScreen());
      case AppRoute.vehiclePollution:
        return ScreenTransitions.bottomToTopTransition(
            const VehiclePollution());
      case AppRoute.applicationSubmitted:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            ApplicationSubmittedScreen(sharedStore: sharedStore));
      case AppRoute.dashBoard:
        return ScreenTransitions.rightToLeftTransitionWithEvent(
            DashboardScreen(sharedStore: sharedStore));

      case AppRoute.currentBalance:
        return ScreenTransitions.rightToLeftTransition(
            CurrentBalanceDetailsScreen(currentBalanceKM: retrievedArgument));

      case AppRoute.profileDetails:
        return ScreenTransitions.rightToLeftTransition(
            ProfileDetailsScreen(profileShortDescription: retrievedArgument));

      case AppRoute.todaysPayment:
        return ScreenTransitions.rightToLeftTransition(
            const TodaysPaymentDetails());

      case AppRoute.referScreen:
        return ScreenTransitions.rightToLeftTransition(const ReferScreen());

      case AppRoute.termsAndConditionsScreen:
        return ScreenTransitions.rightToLeftTransition(
            const TermsAndConditionsScreen());

      case AppRoute.privacyPolicyScreen:
        return ScreenTransitions.rightToLeftTransition(
            const PrivacyPolicyScreen());

      case AppRoute.refundPolicyScreen:
        return ScreenTransitions.rightToLeftTransition(
            const RefundPolicyScreen());

      case AppRoute.helpScreen:
        return ScreenTransitions.rightToLeftTransition(const HelpScreen());

      case AppRoute.emergencySupportScreen:
        return ScreenTransitions.rightToLeftTransition(const EmergencyScreen());

      case AppRoute.paymentSummery:
        return ScreenTransitions.rightToLeftTransition(
            const PaymentSummeryScreen());

      case AppRoute.amountTransfferedByDay:
        return ScreenTransitions.rightToLeftTransition(
            const AmountTransfferedbyDayScreen());
      case AppRoute.tripsScreen:
        return ScreenTransitions.rightToLeftTransition(const TripsScreen());
      case AppRoute.rideNavigation:
        return ScreenTransitions.bottomToTopTransition(RideNavigationScreen(
          rideId: retrievedArgument as RideId,
        ));
      default:
        return null;
    }
  }

  _retrieveArgument(Object? arguments) {
    if (arguments != null) {
      if (arguments is String) {
        return arguments;
      }
      if (arguments is ProfileShortDescription) {
        return arguments;
      }
      if (arguments is RideId) {
        return arguments;
      }
    }
  }
}
