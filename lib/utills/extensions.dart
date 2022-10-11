import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/audit_step.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_one.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_three.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_two.dart';
import 'package:jadu_ride_driver/presentation/stores/intro_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';

extension IntroPage on int {
  Widget getIntroPage(IntroStore store) {
    switch (this) {
      case 0:
        return IntroOne(store: store);
      case 1:
        return IntroTwo(store: store, pos: this);
      case 2:
        return IntroThree(store: store, pos: this);
    }
    return const SizedBox.shrink();
  }
}

extension MyText on String {
  Widget text(
      [TextStyle? textStyle, TextOverflow? textOverflow, TextAlign? align]) {
    return Text(
      this.tr(),
      style: textStyle,
      overflow: textOverflow,
      textAlign: align,
    );
  }
}

extension MyPadding on Widget {
  Widget padding({required EdgeInsets insets}) {
    return Padding(
      padding: insets,
      child: this,
    );
  }
}

extension MyFittedBox on Object {
  Widget fitBox({BoxFit fit = BoxFit.contain, required Widget child}) {
    return FittedBox(
      fit: fit,
      child: child,
    );
  }
}

extension MyExpanded on Object {
  Widget expand({required int flex, required Widget child}) {
    return Expanded(flex: flex, child: child);
  }
}

extension DetailsStepKeyMapper on String {
  String toDetailStepName() {
    if (this == DetailsStepKey.identifyDetails.key) {
      return StringProvider.indentifyDetails;
    } else if (this == DetailsStepKey.profilePicture.key) {
      return StringProvider.profilePicture;
    } else if (this == DetailsStepKey.driverLicense.key) {
      return StringProvider.driverLicense;
    } else if (this == DetailsStepKey.aadharCard.key) {
      return StringProvider.aadharCard;
    } else if (this == DetailsStepKey.vehicleInsurance.key) {
      return StringProvider.vehicleInsurance;
    } else if (this == DetailsStepKey.registrationCertificate.key) {
      return StringProvider.registrationCertificate;
    } else if (this == DetailsStepKey.panCard.key) {
      return StringProvider.panCard;
    } else if (this == DetailsStepKey.vehiclePermit.key) {
      return StringProvider.vehiclePermit;
    } else if (this == DetailsStepKey.vehicleAudit.key) {
      return StringProvider.vehicleAudit;
    } else if (this == DetailsStepKey.paymentDetails.key) {
      return StringProvider.paymentDetails;
    } else if (this == DetailsStepKey.vehiclePollution.key) {
      return StringProvider.vehiclePollution;
    } else {
      return "";
    }
  }
}

extension AuditStepKeyMapper on VehicleAuditStep {
  String toAuditStepName() {
    switch (stepKey) {
      case AuditStep.chasisNumberImage:
        return name;
      case AuditStep.backSideWithNumberPlate:
        return name;
      case AuditStep.leftSideExterior:
        return name;
      case AuditStep.rightSideExterior:
        return name;
      case AuditStep.carInside:
        return name;
      default:
        return "";
    }
  }
}

extension MyApiCall on Future<BusinessObject> {
  Future<Resource<R>> handleResponse<R>() async {
    try {
      var result = await this;
      return Success(result as R);
    } on DioError catch (ex) {
      switch (ex.type) {
        case DioErrorType.connectTimeout:
          return Error(message: ex.message);
        case DioErrorType.sendTimeout:
          return Error(message: ex.message);
        case DioErrorType.receiveTimeout:
          return Error(message: ex.message);
        case DioErrorType.response:
          return Error(message: ex.message);
        case DioErrorType.cancel:
          return Error(message: ex.message);
        case DioErrorType.other:
          return Error(message: ex.message);
      }
    }
  }
}

extension FixedBoxShadow on Object {
  List<BoxShadow> allShadow() {
    return [
      BoxShadow(
        color: AppColors.Gallery,
        blurRadius: 8.0, // soften the shadow
        spreadRadius: 0.0, //extend the shadow
        offset: const Offset(
          5.0, // Move to right 10  horizontally
          5.0, // Move to bottom 10 Vertically
        ),
      ),
      BoxShadow(
        color: AppColors.Gallery,
        blurRadius: 8.0, // soften the shadow
        spreadRadius: 0.0, //extend the shadow
        offset: const Offset(
          -5.0, // Move to right 10  horizontally
          -5.0, // Move to bottom 10 Vertically
        ),
      ),
    ];
  }
}
