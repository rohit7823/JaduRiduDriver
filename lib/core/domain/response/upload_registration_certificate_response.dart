import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadRegistrationCertificateResponse
    uploadRegistrationCertificateResponseFromJson(String str) =>
        UploadRegistrationCertificateResponse.fromJson(json.decode(str));

String uploadRegistrationCertificateResponseToJson(
        UploadRegistrationCertificateResponse data) =>
    json.encode(data.toJson());

class UploadRegistrationCertificateResponse extends BusinessObject {
  UploadRegistrationCertificateResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadRegistrationCertificateResponse.fromJson(
          Map<String, dynamic> json) =>
      UploadRegistrationCertificateResponse(
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
