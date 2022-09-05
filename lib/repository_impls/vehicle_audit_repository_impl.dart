import 'package:jadu_ride_driver/core/common/app_constants.dart';
import 'package:jadu_ride_driver/core/common/audit_step.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/audit_required_steps_response.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_audit_repository.dart';

class VehicleAuditRepositoryImpl implements VehicleAuditRepository {
  @override
  Future<Resource<AuditRequiredStepsResponse>> requiredSteps(
      String userId) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(
        AuditRequiredStepsResponse(status: true, message: "Success", steps: [
      VehicleAuditStep(
          stepKey: AuditStep.chasisNumberImage,
          name: "Chassis Number Image",
          isCompleted: true),
      VehicleAuditStep(
          stepKey: AuditStep.backSideWithNumberPlate,
          name: "Back side with number plate",
          isCompleted: true),
      VehicleAuditStep(
          stepKey: AuditStep.leftSideExterior,
          name: "Left side exterior",
          isCompleted: true),
      VehicleAuditStep(
          stepKey: AuditStep.rightSideExterior,
          name: "Right side exterior",
          isCompleted: true),
      VehicleAuditStep(
          stepKey: AuditStep.carInside, name: "Car Inside", isCompleted: true),
    ]));
  }
}
