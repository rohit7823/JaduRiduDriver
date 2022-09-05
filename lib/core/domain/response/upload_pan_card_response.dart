import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadPanCardResponse uploadPanCardResponseFromJson(String str) =>
    UploadPanCardResponse.fromJson(json.decode(str));

String uploadPanCardResponseToJson(UploadPanCardResponse data) =>
    json.encode(data.toJson());

class UploadPanCardResponse extends BusinessObject {
  UploadPanCardResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadPanCardResponse.fromJson(Map<String, dynamic> json) =>
      UploadPanCardResponse(
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
