import 'dart:convert';

import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/common/service.dart';

RideInitiateData rideInitiateDataFromJson(String str) =>
    RideInitiateData.fromJson(json.decode(str));

String rideInitiateDataToJson(RideInitiateData data) =>
    json.encode(data.toJson());

class RideInitiateData {
  String customerName;
  String currentStage;
  String serviceType;
  LatLong pickUpLocation;

  RideInitiateData(
      {required this.customerName,
      required this.currentStage,
      required this.serviceType,
      required this.pickUpLocation});

  factory RideInitiateData.fromJson(Map<String, dynamic> json) =>
      RideInitiateData(
        customerName: json["customerName"],
        currentStage: json["currentStage"],
        serviceType: json["serviceId"],
        pickUpLocation: LatLong.fromJson(json["pickUpLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "customerName": customerName,
        "currentStage": currentStage,
        "serviceType": serviceType,
        "pickUpLocation": pickUpLocation.toJson(),
      };
}
