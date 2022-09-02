import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/app_version.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

AppVersionResponse appVersionResponseFromJson(String str) =>
    AppVersionResponse.fromJson(json.decode(str));

String appVersionResponseToJson(AppVersionResponse data) =>
    json.encode(data.toJson());

class AppVersionResponse extends BusinessObject {
  AppVersionResponse(
      {required this.status, required this.message, required this.version});

  bool status;
  String message;
  AppVersion version;

  factory AppVersionResponse.fromJson(Map<String, dynamic> json) =>
      AppVersionResponse(
        status: json["status"],
        message: json["message"],
        version: AppVersion.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "version": version.toJson(),
      };
}
