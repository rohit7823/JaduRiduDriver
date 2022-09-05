import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadDriverLicenseResponse uploadDriverLicenseResponseFromJson(String str) =>
    UploadDriverLicenseResponse.fromJson(json.decode(str));

String uploadDriverLicenseResponseToJson(UploadDriverLicenseResponse data) =>
    json.encode(data.toJson());

class UploadDriverLicenseResponse extends BusinessObject {
  UploadDriverLicenseResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadDriverLicenseResponse.fromJson(Map<String, dynamic> json) =>
      UploadDriverLicenseResponse(
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
