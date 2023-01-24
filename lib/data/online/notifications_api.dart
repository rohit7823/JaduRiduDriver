import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/getNotifiicationResponse.dart';


part 'notifications_api.g.dart';

@RestApi()
abstract class NotificationsApi {
  factory NotificationsApi(Dio dio, {String baseUrl}) = _NotificationsApi;

  @GET("users/{userId}/notifications")
  Future<GetNotificationResponse> api(@Path("userId") String userId);
}