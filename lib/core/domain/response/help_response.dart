import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

HelpResponse helpResponseFromJson(String str) =>
    HelpResponse.fromJson(json.decode(str));

String helpResponseToJson(HelpResponse data) =>
    json.encode(data.toJson());

class HelpResponse extends BusinessObject {
  HelpResponse(
      {required this.status, required this.message, required this.isSubmitted});

  bool status;
  String message;
  bool isSubmitted;

  factory HelpResponse.fromJson(Map<String, dynamic> json) =>
      HelpResponse(
        status: json["status"],
        message: json["message"],
        isSubmitted: json["isSubmitted"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isSubmitted": isSubmitted,
  };
}
