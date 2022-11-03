import 'dart:convert';

import 'business_object.dart';

UploadVehicleNumberPlateResponse uploadVehicleNumberPlateResponseFromJson(
        String str) =>
    UploadVehicleNumberPlateResponse.fromJson(json.decode(str));

String uploadVehicleNumberPlateResponseToJson(
        UploadVehicleNumberPlateResponse data) =>
    json.encode(data.toJson());

class UploadVehicleNumberPlateResponse extends BusinessObject {
  UploadVehicleNumberPlateResponse(
      {required this.status, required this.message, required this.isUploading});

  bool status;
  String message;
  bool isUploading;

  factory UploadVehicleNumberPlateResponse.fromJson(
          Map<String, dynamic> json) =>
      UploadVehicleNumberPlateResponse(
        status: json["status"],
        message: json["message"],
        isUploading: json["isSubmitted"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isSubmitted": isUploading,
      };
}
