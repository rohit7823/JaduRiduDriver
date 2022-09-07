import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/user_primary_registration_response.dart';
import 'package:retrofit/http.dart';

part 'welcome_jadu_ride_api.g.dart';

@RestApi()
abstract class WelcomeJaduRideApi {
  factory WelcomeJaduRideApi(Dio dio, {String? baseUrl}) = _WelcomeJaduRideApi;

  @POST("${ApiRoutes.parent}/users/{userId}/details")
  Future<UserPrimaryRegistrationResponse> driverDetails(
      @Path("userId") String userId,
      @Field("name") String userName,
      @Field("email") String userEmail,
      @Field("refferal_code") String refferalCode,
      @Field("state_id") String stateID,
      @Field("district_id") String districtId,
      @Field("city_id") String cityId);
}
