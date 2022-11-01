import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/audit_required_steps_response.dart';
import 'package:retrofit/retrofit.dart';

part 'required_steps_vehicle_audit_api.g.dart';

@RestApi()
abstract class RequiredStepsVehicleAuditApi {
  factory RequiredStepsVehicleAuditApi(Dio dio, {String baseUrl}) =
      _RequiredStepsVehicleAuditApi;

  @GET("${ApiRoutes.parent}/users/{userId}/stepVehicleAudit")
  Future<AuditRequiredStepsResponse> auditSteps(@Path("userId") String userIs);
}
