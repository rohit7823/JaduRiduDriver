import 'dart:convert';

import 'package:jadu_ride_driver/core/common/lat_long.dart';

RideInitiateData rideInitiateDataFromJson(String str) =>
    RideInitiateData.fromJson(json.decode(str));

String rideInitiateDataToJson(RideInitiateData data) =>
    json.encode(data.toJson());

class RideInitiateData {
  String customerName;
  String currentStage;
  String serviceType;
  int timer;
  LatLong pickUpLocation;

  RideInitiateData(
      {required this.customerName,
      required this.currentStage,
      required this.serviceType,
      required this.timer,
      required this.pickUpLocation});

  factory RideInitiateData.fromJson(Map<String, dynamic> json) =>
      RideInitiateData(
        customerName: json["customerName"],
        currentStage: json["currentStage"],
        serviceType: json["serviceId"],
        timer: json["timer"],
        pickUpLocation: LatLong.fromJson(json["pickUpLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "customerName": customerName,
        "currentStage": currentStage,
        "serviceType": serviceType,
        "timer": timer,
        "pickUpLocation": pickUpLocation.toJson(),
      };
}
