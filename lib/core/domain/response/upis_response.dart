import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/upi_id.dart';

UpisResponse upisResponseFromJson(String str) => UpisResponse.fromJson(json.decode(str));

String upisResponseToJson(UpisResponse data) => json.encode(data.toJson());

class UpisResponse extends BusinessObject{
  UpisResponse(
      {required this.status, required this.message, required this.upis});

  bool status;
  String message;
  List<UpiID> upis;

  factory UpisResponse.fromJson(Map<String, dynamic> json) => UpisResponse(
    status: json["status"],
    message: json["message"],
    upis: List<UpiID>.from(json["upiHandles"].map((x) => UpiID.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "upiHandles": List<dynamic>.from(upis.map((x) => x.toJson())),
  };
}