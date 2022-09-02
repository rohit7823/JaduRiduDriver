import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';

class AuditRequiredStepsResponse {
  bool status;
  String message;
  List<VehicleAuditStep> steps;

  AuditRequiredStepsResponse(
      {required this.status, required this.message, required this.steps});
}
