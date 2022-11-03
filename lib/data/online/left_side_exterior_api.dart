import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_exterior_response.dart';
import 'package:retrofit/http.dart';

part 'left_side_exterior_api.g.dart';

@RestApi()
abstract class LeftSideExteriorApi {
  factory LeftSideExteriorApi(Dio dio, {String baseUrl}) = _LeftSideExteriorApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/leftExterior")
  @MultiPart()
  Future<UploadExteriorResponse> upload(
      @Path("userId") String userId,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
