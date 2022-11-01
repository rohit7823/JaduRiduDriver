import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

DistrictsResponse districtsResponseFromJson(String str) =>
    DistrictsResponse.fromJson(json.decode(str));

String districtsResponseToJson(DistrictsResponse data) =>
    json.encode(data.toJson());

class DistrictsResponse extends BusinessObject {
  DistrictsResponse(
      {required this.status, required this.message, required this.districts});

  bool status;
  String message;
  List<Package> districts;

  factory DistrictsResponse.fromJson(Map<String, dynamic> json) =>
      DistrictsResponse(
        status: json["status"],
        message: json["message"],
        districts: List<Package>.from(
            json["districts"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
      };
}
