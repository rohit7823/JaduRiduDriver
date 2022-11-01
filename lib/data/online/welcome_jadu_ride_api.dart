import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/districts_response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_welcome_jadu_ride_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_primary_registration_response.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/cities_response.dart';

part 'welcome_jadu_ride_api.g.dart';

@RestApi()
abstract class WelcomeJaduRideApi {
  factory WelcomeJaduRideApi(Dio dio, {String? baseUrl}) = _WelcomeJaduRideApi;

  @POST("${ApiRoutes.parent}/users/{userId}/details")
  @FormUrlEncoded()
  Future<UserPrimaryRegistrationResponse> driverDetails(
      @Path("userId") String userId,
      @Field("name") String userName,
      @Field("email") String userEmail,
      @Field("refferal_code") String refferalCode,
      @Field("state_id") String stateID,
      @Field("district_id") String districtId,
      @Field("city_id") String cityId);

  @GET("${ApiRoutes.parent}/districts")
  Future<DistrictsResponse> districts(@Query("state_id") String stateId);

  @GET("${ApiRoutes.parent}/cities")
  Future<CitiesResponse> cities(@Query("district_id") String districtId);

  @GET("${ApiRoutes.parent}/users/{userId}/requiredDataInRegistration")
  Future<RequiredDataWelcomeJaduRideResponse> initialData(
      @Path("userId") String userId);
}
