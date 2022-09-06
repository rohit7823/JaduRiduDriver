import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

UploadVehiclePermitResponse uploadVehiclePermitResponseFromJson(String str) =>
    UploadVehiclePermitResponse.fromJson(json.decode(str));

String uploadVehiclePermitResponseToJson(UploadVehiclePermitResponse data) =>
    json.encode(data.toJson());

class UploadVehiclePermitResponse extends BusinessObject {
  UploadVehiclePermitResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadVehiclePermitResponse.fromJson(Map<String, dynamic> json) =>
      UploadVehiclePermitResponse(
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
