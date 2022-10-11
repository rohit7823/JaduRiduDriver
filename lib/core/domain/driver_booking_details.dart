import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/customer_details.dart';

DriverBookingDetails driverBookingDetailsFromJson(String str) =>
    DriverBookingDetails.fromJson(json.decode(str));

String driverBookingDetailsToJson(DriverBookingDetails data) =>
    json.encode(data.toJson());

class DriverBookingDetails {
  String bookId;
  String vehicleType;
  String pickUpLocation;
  String estimateDistance;
  String eta;
  CustomerDetails customerDetails;
  int passTimer;
  double lat;
  double lng;

  DriverBookingDetails(
      {required this.bookId,
      required this.vehicleType,
      required this.pickUpLocation,
      required this.customerDetails,
      required this.passTimer,
      required this.estimateDistance,
      required this.eta,
      required this.lat,
      required this.lng});

  factory DriverBookingDetails.fromJson(Map<String, dynamic> json) =>
      DriverBookingDetails(
        bookId: json["rideId"],
        vehicleType: json["vehicleType"],
        pickUpLocation: json["pickUpLocation"],
        estimateDistance: json["estimateDistance"],
        eta: json["eta"],
        passTimer: json["passTimer"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        customerDetails: CustomerDetails.fromJson(json["customerDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "rideId": bookId,
        "vehicleType": vehicleType,
        "pickUpLocation": pickUpLocation,
        "estimateDistance": estimateDistance,
        "eta": eta,
        "passTimer": passTimer,
        "lat": lat,
        "lng": lng,
        "customerDetails": customerDetails.toJson(),
      };
}
