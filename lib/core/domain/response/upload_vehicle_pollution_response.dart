import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class UploadVehiclePollutionResponse extends BusinessObject {
  bool status;
  String message;
  bool isSubmitted;

  UploadVehiclePollutionResponse(
      {required this.status, required this.message, required this.isSubmitted});

  factory UploadVehiclePollutionResponse.fromJson(Map<String, dynamic> json) =>
      UploadVehiclePollutionResponse(
        status: json["status"],
        message: json["message"],
        isSubmitted: json["isSubmitted"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isSubmitted": isSubmitted,
      };
}
