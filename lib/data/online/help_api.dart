

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/help_response.dart';
import 'package:jadu_ride_driver/core/domain/response/partner_care_response.dart';
import 'package:retrofit/http.dart';


part 'help_api.g.dart';


@RestApi()
abstract class HelpApi {
  factory HelpApi(Dio dio, {String? baseUrl}) = _HelpApi;

  @POST("${ApiRoutes.parent}/users/{userId}/help")
  @FormUrlEncoded()
  Future<HelpResponse> helpCall(
      @Path("userId") String userId,
      @Field("name") String name,
      @Field("email") String email,
      @Field("message") String message,
      @Field("subject") String subject);

}
