import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

SetDriverStatusResponse setDriverStatusResponseFromJson(String str) =>
    SetDriverStatusResponse.fromJson(json.decode(str));

String setDriverStatusResponseToJson(SetDriverStatusResponse data) =>
    json.encode(data.toJson());

class SetDriverStatusResponse extends BusinessObject {
  bool status;
  String message;
  bool isUpdated;

  SetDriverStatusResponse(
      {required this.status, required this.message, required this.isUpdated});

  factory SetDriverStatusResponse.fromJson(Map<String, dynamic> json) =>
      SetDriverStatusResponse(
        status: json["status"],
        message: json["message"],
        isUpdated: json["isUpdated"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isUpdated": isUpdated,
      };
}
