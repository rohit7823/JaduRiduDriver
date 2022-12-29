import 'dart:convert';

import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/common/skip_ride_stage.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

RideInitiateData rideInitiateDataFromJson(String str) =>
    RideInitiateData.fromJson(json.decode(str));

String rideInitiateDataToJson(RideInitiateData data) =>
    json.encode(data.toJson());

class RideInitiateData {
  String customerName;
  String currentStage;
  String serviceType;
  LatLong pickUpLocation;
  SkipRideStage? isSkipped;
  SkipRideStage? isSkipEndTrip;
  String rideId;

  RideInitiateData(
      {required this.customerName,
      required this.currentStage,
      required this.serviceType,
      required this.rideId,
      required this.isSkipped,
      required this.isSkipEndTrip,
      required this.pickUpLocation});

  factory RideInitiateData.fromJson(Map<String, dynamic> json) =>
      RideInitiateData(
        customerName: json["customerName"],
        currentStage: json["currentStage"],
        serviceType: json["serviceId"],
        rideId: json["rideId"] ?? "",
        isSkipped: json["skipOnRideEmission"] != null
            ? (json["skipOnRideEmission"] as String).toSkipStageKey()
            : null,
        isSkipEndTrip: json["skipOnRideEndEmission"] != null
            ? (json["skipOnRideEndEmission"] as String).toSkipStageKey()
            : null,
        pickUpLocation: LatLong.fromJson(json["pickUpLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "customerName": customerName,
        "currentStage": currentStage,
        "serviceType": serviceType,
        "rideId": rideId,
        "pickUpLocation": pickUpLocation.toJson(),
      };
}
