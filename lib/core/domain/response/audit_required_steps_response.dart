import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';

import 'business_object.dart';

AuditRequiredStepsResponse auditRequiredStepsResponseFromJson(String str) =>
    AuditRequiredStepsResponse.fromJson(json.decode(str));

String auditRequiredStepsResponseToJson(AuditRequiredStepsResponse data) =>
    json.encode(data.toJson());

class AuditRequiredStepsResponse extends BusinessObject {
  AuditRequiredStepsResponse(
      {required this.status, required this.message, required this.steps});

  bool status;
  String message;
  List<VehicleAuditStep> steps;

  factory AuditRequiredStepsResponse.fromJson(Map<String, dynamic> json) =>
      AuditRequiredStepsResponse(
        status: json["status"],
        message: json["message"],
        steps: List<VehicleAuditStep>.from(
            json["steps"].map((x) => VehicleAuditStep.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
      };
}
