import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

AppLanguageUpdateResponse appLanguageUpdateResponseFromJson(String str) =>
    AppLanguageUpdateResponse.fromJson(json.decode(str));

String appLanguageUpdateResponseToJson(AppLanguageUpdateResponse data) =>
    json.encode(data.toJson());

class AppLanguageUpdateResponse extends BusinessObject {
  AppLanguageUpdateResponse(
      {required this.status, required this.message, required this.isUpdated});

  bool status;
  String message;
  bool isUpdated;

  factory AppLanguageUpdateResponse.fromJson(Map<String, dynamic> json) =>
      AppLanguageUpdateResponse(
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
