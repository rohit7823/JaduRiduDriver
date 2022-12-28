
//
// import 'package:jadu_ride_driver/core/domain/driver_status_model.dart';
//
// class DriverStatusResponse {
//   bool status;
//   String message;
//   DriverStatusModel driverStatus;
//
//
//   DriverStatusResponse({
//     required this.status,
//     required this.message,
//     required this.driverStatus});
// }



import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

DriverStatusResponse driverStatusResponseFromJson(String str) => DriverStatusResponse.fromJson(json.decode(str));

String driverStatusResponseToJson(DriverStatusResponse data) => json.encode(data.toJson());

class DriverStatusResponse extends BusinessObject{
  DriverStatusResponse({
    required this.status,
    required this.message,
    required this.currentStatus,
  });

  final bool status;
  final String message;
  final String currentStatus;

  factory DriverStatusResponse.fromJson(Map<String, dynamic> json) => DriverStatusResponse(
    status: json["status"],
    message: json["message"],
    currentStatus: json["currentStatus"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "currentStatus": currentStatus,
  };
}
