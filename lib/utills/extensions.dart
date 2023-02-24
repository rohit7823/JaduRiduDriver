import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/audit_step.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/driver_account_status.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/ride_stages.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/service_type.dart';
import 'package:jadu_ride_driver/core/common/skip_ride_stage.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_one.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_three.dart';
import 'package:jadu_ride_driver/presentation/nested_screens/intro_two.dart';
import 'package:jadu_ride_driver/presentation/stores/intro_screen_store.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/presentation/ui/theme.dart';
import '../core/common/lat_long.dart';
import 'directions.dart' as dir;
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:math';

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

extension LatLngJson on LatLng {
  Map<String, dynamic> toJsonFormat() {
    return LatLong(lat: latitude, lng: longitude).toJson();
  }
}

extension LatLngListJson on List<LatLng> {
  List<Map<String, dynamic>> toJsonFormat() {
    var tmp = <Map<String, dynamic>>[];
    forEach((e) {
      tmp.add(LatLong(lat: e.latitude, lng: e.longitude).toJson());
    });
    return tmp;
  }
}

extension LegsConvertToJson on List<dir.Leg> {
  List<Map<String, dynamic>> toJson() {
    var tmp = <Map<String, dynamic>>[];
    forEach((element) {
      tmp.add({
        "startAddress": element.startAddress,
        "endAddress": element.endAddress
      });
    });
    return tmp;
  }
}

extension RoutesCovertToJson on List<dir.Route> {
  List<Map<String, dynamic>> toJson() {
    var tmp = <Map<String, dynamic>>[];
    forEach((element) {
      tmp.addAll(element.legs.toJson());
    });
    return tmp;
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

extension ConvertToSkipRideStage on String {
  SkipRideStage? toSkipStageKey() {
    for (var key in SkipRideStage.values) {
      if (key.value == this) {
        return key;
      }
    }

    return null;
  }
}

extension MyApiCall on Future<BusinessObject> {
  Future<Resource<R>> handleResponse<R>() async {
    try {
      var result = await this;
      return Success(result as R);
    } on DioError catch (ex) {
      switch (ex.type) {
        case DioErrorType.connectionTimeout:
          return Error(message: ex.message);
        case DioErrorType.badCertificate:
          return Error(message: ex.message);
        case DioErrorType.badResponse:
          return Error(message: ex.message);
        case DioErrorType.connectionError:
          return Error(message: ex.message);
        case DioErrorType.unknown:
          return Error(message: ex.message);
        case DioErrorType.sendTimeout:
          return Error(message: ex.message);
          break;
        case DioErrorType.receiveTimeout:
          return Error(message: ex.message);
        case DioErrorType.cancel:
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
      return ImageAssets.bikeService;
    } else if (this == ServiceType.delivery.value) {
      return ImageAssets.deliveryService;
    } else if (this == ServiceType.emergency.value) {
      return ImageAssets.emergency;
    } else if (this == ServiceType.rental.value) {
      return ImageAssets.rentalService;
    } else if (this == ServiceType.book.value) {
      return ImageAssets.callService;
    } else if (this == ServiceType.scan.value) {
      return ImageAssets.scanService;
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

extension ConvertStringToScreenEnum on String {
  Screen toScreen() {
    for (var screen in Screen.values) {
      if (screen.name == this) {
        return screen;
      }
    }
    return Screen.none;
  }
}

Future<File> urlToFile(String imageUrl) async {
// generate random number.
  var rng = Random();
// get temporary directory of device.
  Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
  String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
  File file = File('$tempPath${rng.nextInt(100)}.png');
// call http.get method and pass imageUrl into it to get response.
  http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
  await file.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
  return file;
}
