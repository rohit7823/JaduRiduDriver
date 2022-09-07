import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UserPrimaryRegistrationResponse userPrimaryRegistrationResponseFromJson(
        String str) =>
    UserPrimaryRegistrationResponse.fromJson(json.decode(str));

String userPrimaryRegistrationResponseToJson(
        UserPrimaryRegistrationResponse data) =>
    json.encode(data.toJson());

class UserPrimaryRegistrationResponse extends BusinessObject {
  UserPrimaryRegistrationResponse(
      {required this.status, required this.message, required this.isSaved});

  bool status;
  String message;
  bool isSaved;

  factory UserPrimaryRegistrationResponse.fromJson(Map<String, dynamic> json) =>
      UserPrimaryRegistrationResponse(
        status: json["status"],
        message: json["message"],
        isSaved: json["isAdded"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isAdded": isSaved,
      };
}
