import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadImageResponse uploadImageResponseFromJson(String str) =>
    UploadImageResponse.fromJson(json.decode(str));

String uploadImageResponseToJson(UploadImageResponse data) =>
    json.encode(data.toJson());

class UploadImageResponse extends BusinessObject {
  UploadImageResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      UploadImageResponse(
        status: json["status"],
        message: json["message"],
        isUploaded: json["isAdded"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isAdded": isUploaded,
      };
}
