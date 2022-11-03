import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_driver_license_response.dart';
import 'package:retrofit/http.dart';

part 'driver_license_api.g.dart';

@RestApi()
abstract class DriverLicenseApi {
  factory DriverLicenseApi(Dio dio, {String? baseUrl}) = _DriverLicenseApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/vehicleLicence")
  @MultiPart()
  Future<UploadDriverLicenseResponse> driverLicense(
      @Path("userId") String userId,
      @Part(name: "document_number") String documentNumber,
      @Part(name: "document_image") File documentImage,
      @Part(name: "expiary_date") String expiaryDate,
      Function(int, int) uploading);
}
