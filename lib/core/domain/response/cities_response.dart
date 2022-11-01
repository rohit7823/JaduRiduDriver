import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

CitiesResponse citiesResponseFromJson(String str) =>
    CitiesResponse.fromJson(json.decode(str));

String citiesResponseToJson(CitiesResponse data) => json.encode(data.toJson());

class CitiesResponse extends BusinessObject {
  CitiesResponse(
      {required this.status, required this.message, required this.cities});

  bool status;
  String message;
  List<Package> cities;

  factory CitiesResponse.fromJson(Map<String, dynamic> json) => CitiesResponse(
        status: json["status"],
        message: json["message"],
        cities:
            List<Package>.from(json["cities"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}
