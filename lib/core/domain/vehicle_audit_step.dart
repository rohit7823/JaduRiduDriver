import 'package:jadu_ride_driver/core/common/audit_step.dart';

class VehicleAuditStep {
  AuditStep stepKey;
  String name;
  bool isCompleted;

  VehicleAuditStep(
      {required this.stepKey, required this.name, required this.isCompleted});
}
