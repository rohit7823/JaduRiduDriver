import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_incentive_response.dart';
import 'package:retrofit/http.dart';


part 'incentives_api.g.dart';

@RestApi()
abstract class CollectIncentivesApi{
  factory CollectIncentivesApi(Dio dio, {String? baseUrl}) = _CollectIncentivesApi;

  @GET("${ApiRoutes.parent}/users/{userId}/incentives")
  Future<CollectCouponResponse> collectincentives(@Path("userId") String userId);
}