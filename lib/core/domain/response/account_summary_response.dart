import 'dart:convert';


import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

AccountSummaryResponse accountSummaryResponseFromJson(String str) =>
    AccountSummaryResponse.fromJson(json.decode(str));

String accountSummaryResponseToJson(AccountSummaryResponse data) =>
    json.encode(data.toJson());

class AccountSummaryResponse extends BusinessObject {
  AccountSummaryResponse(
      {required this.status, required this.onlineCollected, required this.message, required this.currentKm, required this.isLow, required this.cashCollected});

  bool status;
  String message;
  bool isLow;
  String currentKm;
  String onlineCollected;
  String cashCollected;

  factory AccountSummaryResponse.fromJson(Map<String, dynamic> json) =>
      AccountSummaryResponse(
        status: json["status"],
        message: json["message"],
        isLow: json["isLow"],
        currentKm: json["currentKm"],
        onlineCollected: json["onlineCollected"],
        cashCollected:  json["cashCollected"],
        );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isLow": isLow,
    "currentKm":currentKm,
    "onlineCollected":onlineCollected,
    "cashCollected":cashCollected
  };
}
