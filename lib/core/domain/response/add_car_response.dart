import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/response/car_category.dart';

CarResponse CarResponseFromJson(String str) =>
    CarResponse.fromJson(json.decode(str));

String CarResponseToJson(CarResponse data) =>
    json.encode(data.toJson());

class CarResponse extends BusinessObject {
  CarResponse(
      {required this.status, required this.message, required this.Car});

  bool status;
  String message;
  List<CarCategory> Car;

  factory CarResponse.fromJson(Map<String, dynamic> json) =>
      CarResponse(
        status: json["status"],
        message: json["message"],
        Car: List<CarCategory>.from(
            json["Car"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "Car": List<dynamic>.from(Car.map((x) => x.toJson())),
  };
}
