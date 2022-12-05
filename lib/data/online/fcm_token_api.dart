import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/domain/response/fcm_token_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/common/api_route.dart';

part 'fcm_token_api.g.dart';

@RestApi()
abstract class FCMTokenApi {
  factory FCMTokenApi(Dio dio, {String baseUrl}) = _FCMTokenApi;

  @POST("${ApiRoutes.parent}/users/{userId}/setDeviceToken")
  @FormUrlEncoded()
  Future<FcmTokenResponse> sendToken(
      @Path("userId") String userId, @Field("device_token") String deviceToken);
}
