import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/upload_insurance_response.dart';

part 'vehicle_insurance_api.g.dart';

@RestApi()
abstract class VehicleInsuranceApi {
  factory VehicleInsuranceApi(Dio dio, {String? baseUrl}) =
      _VehicleInsuranceApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/vehicleInsurance")
  @MultiPart()
  Future<UploadInsuranceResponse> addVehicleInsurance(
      @Path("userId") String userId,
      @Part(name: "document_number") String documentNumber,
      @Part(name: "document_image") File documentImage,
      @Part(name: "expiary_date") String expiryDate,
      @Part(name: "validInsurance") String isValid,
      Function(int, int) uploading);
}
