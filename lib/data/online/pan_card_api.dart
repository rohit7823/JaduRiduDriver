import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/upload_pan_card_response.dart';

part 'pan_card_api.g.dart';

@RestApi()
abstract class PanCardApi {
  factory PanCardApi(Dio dio, {String baseUrl}) = _PanCardApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/pan")
  @MultiPart()
  Future<UploadPanCardResponse> driverPan(
      @Path("userId") String userId,
      @Part(name: "document_number") String documentNumber,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
