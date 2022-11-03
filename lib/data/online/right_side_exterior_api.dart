import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../core/common/api_route.dart';
import '../../core/domain/response/upload_exterior_response.dart';

part 'right_side_exterior_api.g.dart';

@RestApi()
abstract class RightSideExteriorApi {
  factory RightSideExteriorApi(Dio dio, {String baseUrl}) =
      _RightSideExteriorApi;

  @POST("${ApiRoutes.parent}/users/{userId}/document/rightExterior")
  @MultiPart()
  Future<UploadExteriorResponse> upload(
      @Path("userId") String userId,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading);
}
