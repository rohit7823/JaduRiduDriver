import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/aboutwallet_response.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';


DriverWalletResponse driverWalletResponseFromJson(String str) =>
    DriverWalletResponse.fromJson(json.decode(str));

String driverWalletResponseToJson(DriverWalletResponse data) =>
    json.encode(data.toJson());

class DriverWalletResponse extends BusinessObject {
  DriverWalletResponse(
      {required this.status, required this.message, required this.amount});

  bool status;
  String message;
  String amount;
  //WalletDetails details;

  factory DriverWalletResponse.fromJson(Map<String, dynamic> json) =>
      DriverWalletResponse(
        status: json["status"],
        message: json["message"],
        amount: json["amount"]

       // details: WalletDetails.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "amount": amount,
    //"details": details.toJson(),
  };
}

