import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadAadharResponse uploadAadharResponseFromJson(String str) =>
    UploadAadharResponse.fromJson(json.decode(str));

String uploadAadharResponseToJson(UploadAadharResponse data) =>
    json.encode(data.toJson());

class UploadAadharResponse extends BusinessObject {
  UploadAadharResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadAadharResponse.fromJson(Map<String, dynamic> json) =>
      UploadAadharResponse(
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
