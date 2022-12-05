import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/upload_vehicle_permit_response.dart';

part 'vehicle_permit_api.g.dart';

@RestApi()
abstract class VehiclePermitApi {
  factory VehiclePermitApi(Dio dio, {String? baseUrl}) = _VehiclePermitApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/vehiclePermit")
  Future<UploadVehiclePermitResponse> vehiclePermit(
      @Path("userId") String userId,
      @Part(name: "document_number") String documentNumber,
      @Part(name: "document_image") File documentImage,
      @Part(name: "expiary_date") String expiryDate,
      @Part(name: "validPermit") String validPermit,
      Function(int, int) uploading);
}
