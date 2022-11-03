import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/audit_step.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/driver_account_status.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/ride_stages.dart';
import 'package:jadu_ride_driver/core/common/service_type.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_one.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_three.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_two.dart';
import 'package:jadu_ride_driver/presentation/stores/intro_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
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
    if (stepKey == AuditStep.chasisNumberImage.key) {
      return name;
    } else if (stepKey == AuditStep.backSideWithNumberPlate.key) {
      return name;
    } else if (stepKey == AuditStep.backSideWithNumberPlate.key) {
      return name;
    } else if (stepKey == AuditStep.leftSideExterior.key) {
      return name;
    } else if (stepKey == AuditStep.rightSideExterior.key) {
      return name;
    } else if (stepKey == AuditStep.carInside.key) {
      return name;
    }
    return "";
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

extension ConvertToRideState on String {
  RideStages toRideStage() {
    RideStages found = RideStages.none;
    for (var element in RideStages.values) {
      if (element.key == this) {
        found = element;
        break;
      }
    }

    return found;
  }
}

extension ConvertToService on String {
  String toServiceIconPath() {
    if (this == ServiceType.car.value) {
      return ImageAssets.car;
    } else if (this == ServiceType.bike.value) {
      return "";
    }

    return "";
  }

  String toServiceIconName() {
    if (this == ServiceType.car.value) {
      return "Car";
    } else if (this == ServiceType.bike.value) {
      return "Bike";
    }

    return "";
  }
}

extension WidgetUitilities on Widget {
  Widget paddings({
    double all = 0.0,
    double horizontal = 0.0,
    double vertical = 0.0,
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    horizontal = horizontal == 0.0 ? all : horizontal;
    vertical = vertical == 0.0 ? all : vertical;
    left = left == 0.0 ? horizontal : left;
    right = right == 0.0 ? horizontal : right;
    top = top == 0.0 ? vertical : top;
    bottom = bottom == 0.0 ? vertical : bottom;
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget get faded => ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.purple,
              Colors.transparent,
              Colors.transparent,
              Colors.purple
            ],
            stops: [
              0.0,
              0.1,
              0.9,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: this,
      );

  Widget get fadedH => ShaderMask(
        shaderCallback: (Rect rect) {
          return LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.purple,
              Colors.transparent,
              Colors.transparent,
              Colors.purple
            ],
            stops: [
              0.0,
              0.1,
              0.9,
              1.0
            ], // 10% purple, 80% transparent, 10% purple
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: this,
      );

  Widget get noScrollGlow =>
      NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: this);

  Widget noScrollGlowEx(bool ret) =>
      NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return ret;
          },
          child: this);

  Widget colored(Color color, {Key? key}) {
    return Container(
      key: key,
      child: this,
      decoration: BoxDecoration(color: color),
    );
  }

  Widget get wrapInCenter {
    return wrap.center;
  }

  Widget get wrap {
    return Wrap(
      children: [this],
    );
  }

  Widget get center {
    return Center(
      child: this,
    );
  }

  SizedBox sized({double width = 0.0, double height = 0.0}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  /*Widget padding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }*/

  Widget px(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget py(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget p({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }

  Widget pa(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }
}

extension ConvertToDriverAccountStatus on String {
  DriverAccountStatus toAccountStatus() {
    for (var s in DriverAccountStatus.values) {
      if (this == s.status) {
        return s;
      }
    }
    return DriverAccountStatus.none;
  }
}
