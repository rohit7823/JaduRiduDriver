import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/aboutwallet_response.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';


DriverWalletResponse driverWalletResponseFromJson(String str) =>
    DriverWalletResponse.fromJson(json.decode(str));

String driverWalletResponseToJson(DriverWalletResponse data) =>
    json.encode(data.toJson());

class DriverWalletResponse extends BusinessObject {
  DriverWalletResponse(
      {required this.status, required this.message, required this.details});

  bool status;
  String message;
  WalletDetails details;

  factory DriverWalletResponse.fromJson(Map<String, dynamic> json) =>
      DriverWalletResponse(
        status: json["status"],
        message: json["message"],
        details: WalletDetails.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "details": details.toJson(),
  };
}

