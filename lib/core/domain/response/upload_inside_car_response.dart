import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadInsideCarResponse uploadInsideCarResponseFromJson(String str) =>
    UploadInsideCarResponse.fromJson(json.decode(str));

String uploadInsideCarResponseToJson(UploadInsideCarResponse data) =>
    json.encode(data.toJson());

class UploadInsideCarResponse extends BusinessObject {
  UploadInsideCarResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadInsideCarResponse.fromJson(Map<String, dynamic> json) =>
      UploadInsideCarResponse(
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
