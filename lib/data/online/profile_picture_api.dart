import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/upload_image_response.dart';

part 'profile_picture_api.g.dart';

@RestApi()
abstract class ProfilePictureApi {
  factory ProfilePictureApi(Dio dio, {String baseUrl}) = _ProfilePictureApi;

  @POST("${ApiRoutes.parent}/users/{userId}/profilePicture")
  @MultiPart()
  Future<UploadImageResponse> profilePicture(
      @Path("userId") String userId,
      @Part(name: "profile_image") File profileImage,
      Function(int, int) sentProgress);
}
