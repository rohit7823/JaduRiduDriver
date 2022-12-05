import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/retrofit.dart';
import '../../core/domain/response/upload_chasis_number_response.dart';

part 'chassis_number_api.g.dart';

@RestApi()
abstract class ChassisNumberApi {
  factory ChassisNumberApi(Dio dio, {String baseUrl}) = _ChassisNumberApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/chassis")
  @MultiPart()
  Future<UploadChasisNumberResponse> uploadChassis(
      @Path("userId") String userId,
      @Part(name: "document_number") String documentNumber,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
