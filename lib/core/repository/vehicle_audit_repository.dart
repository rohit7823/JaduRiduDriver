import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';

import '../domain/response/audit_required_steps_response.dart';

abstract class VehicleAuditRepository {
  Future<Resource<AuditRequiredStepsResponse>> requiredSteps(String userId);
}
