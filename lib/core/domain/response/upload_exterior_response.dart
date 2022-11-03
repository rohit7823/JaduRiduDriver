import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadExteriorResponse uploadExteriorResponseFromJson(String str) =>
    UploadExteriorResponse.fromJson(json.decode(str));

String uploadExteriorResponseToJson(UploadExteriorResponse data) =>
    json.encode(data.toJson());

class UploadExteriorResponse extends BusinessObject {
  UploadExteriorResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadExteriorResponse.fromJson(Map<String, dynamic> json) =>
      UploadExteriorResponse(
        status: json["status"],
        message: json["message"],
        isUploaded: json["isSubmitted"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isSubmitted": isUploaded,
      };
}
