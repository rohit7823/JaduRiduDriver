import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadInsuranceResponse uploadInsuranceResponseFromJson(String str) =>
    UploadInsuranceResponse.fromJson(json.decode(str));

String uploadInsuranceResponseToJson(UploadInsuranceResponse data) =>
    json.encode(data.toJson());

class UploadInsuranceResponse extends BusinessObject {
  UploadInsuranceResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadInsuranceResponse.fromJson(Map<String, dynamic> json) =>
      UploadInsuranceResponse(
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
