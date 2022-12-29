import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/customer_details.dart';

DriverBookingDetails driverBookingDetailsFromJson(String str) =>
    DriverBookingDetails.fromJson(json.decode(str));

String driverBookingDetailsToJson(DriverBookingDetails data) =>
    json.encode(data.toJson());

class DriverBookingDetails {
  String bookId;
  String vehicleType;
  CustomerDetails customerDetails;
  int passTimer;
  double lat;
  double lng;
  String? alertSoundUrl;

  DriverBookingDetails(
      {required this.bookId,
      required this.vehicleType,
      required this.customerDetails,
      required this.passTimer,
      required this.lat,
      required this.lng,
      required this.alertSoundUrl});

  factory DriverBookingDetails.fromJson(Map<String, dynamic> json) =>
      DriverBookingDetails(
        bookId: json["rideId"],
        vehicleType: json["vehicleType"],
        passTimer: json["passTimer"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        alertSoundUrl: json["alertSoundUrl"],
        customerDetails: CustomerDetails.fromJson(json["customerDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "rideId": bookId,
        "vehicleType": vehicleType,
        "passTimer": passTimer,
        "lat": lat,
        "lng": lng,
        "customerDetails": customerDetails.toJson(),
      };
}
