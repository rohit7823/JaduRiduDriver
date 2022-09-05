import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/upload_aadhar_response.dart';

part 'aadhar_number_api.g.dart';

@RestApi()
abstract class AadharNumberApi {
  factory AadharNumberApi(Dio dio, {String? baseUrl}) = _AadharNumberApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/aadhar")
  @MultiPart()
  Future<UploadAadharResponse> driverAadhar(
      @Path("userId") String userId,
      @Part(name: "document_number") String documentNumber,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
