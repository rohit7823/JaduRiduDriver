import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UserVehicleResponse userVehicleResponseFromJson(String str) =>
    UserVehicleResponse.fromJson(json.decode(str));

String userVehicleResponseToJson(UserVehicleResponse data) =>
    json.encode(data.toJson());

class UserVehicleResponse extends BusinessObject {
  UserVehicleResponse(
      {required this.status, required this.message, required this.isAdded});

  bool status;
  String message;
  bool isAdded;

  factory UserVehicleResponse.fromJson(Map<String, dynamic> json) =>
      UserVehicleResponse(
        status: json["status"],
        message: json["message"],
        isAdded: json["isAdded"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isAdded": isAdded,
      };
}
