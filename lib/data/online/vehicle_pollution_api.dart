import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/upload_vehicle_pollution_response.dart';

part 'vehicle_pollution_api.g.dart';

@RestApi()
abstract class VehiclePollutionApi {
  factory VehiclePollutionApi(Dio dio, {String baseUrl}) = _VehiclePollutionApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/vehiclePollution")
  @MultiPart()
  Future<UploadVehiclePollutionResponse> uploadPollution(
      @Path("userId") String userId,
      @Part(name: "document_number") String documentNumber,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
