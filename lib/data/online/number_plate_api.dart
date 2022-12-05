import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_number_plate_response.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';

part 'number_plate_api.g.dart';

@RestApi()
abstract class NumberPlateApi {
  factory NumberPlateApi(Dio dio, {String baseUrl}) = _NumberPlateApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/numberPlate")
  @MultiPart()
  Future<UploadVehicleNumberPlateResponse> upload(
      @Path("userId") String userId,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
