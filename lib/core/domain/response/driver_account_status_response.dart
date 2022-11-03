import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/account_status.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

DriverAccountStatusResponse driverAccountStatusResponseFromJson(String str) =>
    DriverAccountStatusResponse.fromJson(json.decode(str));

String driverAccountStatusResponseToJson(DriverAccountStatusResponse data) =>
    json.encode(data.toJson());

class DriverAccountStatusResponse extends BusinessObject{
  DriverAccountStatusResponse(
      {required this.status,
      required this.message,
      required this.accountStatus});

  bool status;
  String message;
  AccountStatus accountStatus;

  factory DriverAccountStatusResponse.fromJson(Map<String, dynamic> json) =>
      DriverAccountStatusResponse(
        status: json["status"],
        message: json["message"],
        accountStatus: AccountStatus.fromJson(json["accountStatus"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "accountStatus": accountStatus.toJson(),
      };
}
