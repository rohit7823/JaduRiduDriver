import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/step.dart';

AddAllDetailsInitialDataResponse addAllDetailsInitialDataResponseFromJson(
        String str) =>
    AddAllDetailsInitialDataResponse.fromJson(json.decode(str));

String addAllDetailsInitialDataResponseToJson(
        AddAllDetailsInitialDataResponse data) =>
    json.encode(data.toJson());

class AddAllDetailsInitialDataResponse extends BusinessObject {
  AddAllDetailsInitialDataResponse(
      {required this.status,
      required this.message,
      required this.requiredSteps,
      required this.optionalSteps});

  bool status;
  String message;
  List<DetailStep> requiredSteps;
  List<DetailStep> optionalSteps;

  factory AddAllDetailsInitialDataResponse.fromJson(
          Map<String, dynamic> json) =>
      AddAllDetailsInitialDataResponse(
        status: json["status"],
        message: json["message"],
        requiredSteps: List<DetailStep>.from(
            json["requiredSteps"].map((x) => DetailStep.fromJson(x))),
        optionalSteps: List<DetailStep>.from(
            json["optionalSteps"].map((x) => DetailStep.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "requiredSteps":
            List<dynamic>.from(requiredSteps.map((x) => x.toJson())),
        "optionalSteps":
            List<dynamic>.from(optionalSteps.map((x) => x.toJson())),
      };
}
