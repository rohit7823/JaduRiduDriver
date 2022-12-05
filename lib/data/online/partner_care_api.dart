

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/partner_care_response.dart';
import 'package:retrofit/http.dart';


part 'partner_care_api.g.dart';


@RestApi()
abstract class PartnercareApi {
  factory PartnercareApi(Dio dio, {String? baseUrl}) = _PartnercareApi;

  @POST("${ApiRoutes.parent}/users/{userId}/partnerCare")
  @FormUrlEncoded()
  Future<PartnerCareResponse> partnerCare(
      @Path("userId") String userId,
      @Field("name") String name,
      @Field("email") String email,
      @Field("message") String message,
      @Field("subject") String subject);

}
