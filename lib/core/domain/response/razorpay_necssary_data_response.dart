import 'package:jadu_ride_driver/core/domain/response/business_object.dart';


class RazorpayNecessaryDataResponse extends BusinessObject {
  bool status;
  String message;
  Map<String, dynamic> data;

  RazorpayNecessaryDataResponse(
      {required this.status, required this.message, required this.data});

  factory RazorpayNecessaryDataResponse.fromJson(Map<String, dynamic> json) =>
      RazorpayNecessaryDataResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data,
  };
}
