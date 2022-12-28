import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

NumberCodesResponse numberCodesResponseFromJson(String str) =>
    NumberCodesResponse.fromJson(json.decode(str));

String numberCodesResponseToJson(NumberCodesResponse data) =>
    json.encode(data.toJson());

class NumberCodesResponse extends BusinessObject {
  NumberCodesResponse(
      {required this.status, required this.message, required this.codes});

  bool status;
  String message;
  List<MobileNumberCode> codes;

  factory NumberCodesResponse.fromJson(Map<String, dynamic> json) =>
      NumberCodesResponse(
        status: json["status"],
        message: json["message"],
        codes: List<MobileNumberCode>.from(json["codes"].map((x) => MobileNumberCode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "codes": List<dynamic>.from(codes.map((x) => x.toJson())),
      };
}
