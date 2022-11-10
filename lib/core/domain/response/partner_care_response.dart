import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

PartnerCareResponse partnercareResponseFromJson(String str) =>
    PartnerCareResponse.fromJson(json.decode(str));

String partnercareResponseToJson(PartnerCareResponse data) =>
    json.encode(data.toJson());

class PartnerCareResponse extends BusinessObject {
  PartnerCareResponse(
      {required this.status, required this.message, required this.isSubmitted});

  bool status;
  String message;
  bool isSubmitted;

  factory PartnerCareResponse.fromJson(Map<String, dynamic> json) =>
      PartnerCareResponse(
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
