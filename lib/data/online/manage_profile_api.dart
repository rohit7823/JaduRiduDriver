import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/cities_response.dart';
import 'package:jadu_ride_driver/core/domain/response/districts_response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_profile_details_response.dart';
import 'package:retrofit/http.dart';


part 'manage_profile_api.g.dart';

@RestApi()
abstract class ManageProfileApi{
  factory ManageProfileApi(Dio dio, {String? baseUrl}) = _ManageProfileApi;


  @GET("${ApiRoutes.parent}/districts")
  Future<DistrictsResponse> districts(
      @Query("state_id") String stateId);


  @GET("${ApiRoutes.parent}/cities")
  Future<CitiesResponse> cities(
      @Query("district_id") String districtId);


  @GET("${ApiRoutes.parent}/users/{userId}/profile/details")
  Future<FetchProfileDetailsResponse> getProfile(
      @Path("userId") String userId);
}