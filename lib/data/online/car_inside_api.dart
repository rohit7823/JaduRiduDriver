import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/upload_inside_car_response.dart';

part 'car_inside_api.g.dart';

@RestApi()
abstract class CarInsideApi {
  factory CarInsideApi(Dio dio, {String baseUrl}) = _CarInsideApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/carInside")
  @MultiPart()
  Future<UploadInsideCarResponse> upload(
      @Path("userId") String userId,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
