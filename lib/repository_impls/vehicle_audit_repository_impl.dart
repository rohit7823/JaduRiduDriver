import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/audit_required_steps_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_audit_repository.dart';
import 'package:jadu_ride_driver/data/online/required_steps_vehicle_audit_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class VehicleAuditRepositoryImpl implements VehicleAuditRepository {
  late final RequiredStepsVehicleAuditApi _requiredStepsVehicleAuditApi;
  final Dio _dio;

  VehicleAuditRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _requiredStepsVehicleAuditApi = RequiredStepsVehicleAuditApi(_dio);
  }

  @override
  Future<Resource<AuditRequiredStepsResponse>> requiredSteps(
      String userId) async {
    return _requiredStepsVehicleAuditApi
        .auditSteps(userId)
        .handleResponse<AuditRequiredStepsResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

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
    ]));*/
  }
}
