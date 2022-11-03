import 'dart:convert';

import 'business_object.dart';

UploadChasisNumberResponse uploadChasisNumberResponseFromJson(String str) =>
    UploadChasisNumberResponse.fromJson(json.decode(str));

String uploadChasisNumberResponseToJson(UploadChasisNumberResponse data) =>
    json.encode(data.toJson());

class UploadChasisNumberResponse extends BusinessObject {
  UploadChasisNumberResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadChasisNumberResponse.fromJson(Map<String, dynamic> json) =>
      UploadChasisNumberResponse(
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
