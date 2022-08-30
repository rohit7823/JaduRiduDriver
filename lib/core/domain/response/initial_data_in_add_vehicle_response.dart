import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_category.dart';

InitialDataInAddVehicleResponse initialDataInAddVehicleResponseFromJson(
        String str) =>
    InitialDataInAddVehicleResponse.fromJson(json.decode(str));

String initialDataInAddVehicleResponseToJson(
        InitialDataInAddVehicleResponse data) =>
    json.encode(data.toJson());

class InitialDataInAddVehicleResponse extends BusinessObject {
  InitialDataInAddVehicleResponse(
      {required this.status, required this.message, required this.categories});

  bool status;
  String message;
  List<VehicleCategory> categories;

  factory InitialDataInAddVehicleResponse.fromJson(Map<String, dynamic> json) =>
      InitialDataInAddVehicleResponse(
        status: json["status"],
        message: json["message"],
        categories: List<VehicleCategory>.from(
            json["data"].map((x) => VehicleCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}
