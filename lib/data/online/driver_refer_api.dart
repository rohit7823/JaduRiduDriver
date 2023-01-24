import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/required_data_driver_refer_response.dart';


part 'driver_refer_api.g.dart';

@RestApi()
abstract class DriverReferApi {
  factory DriverReferApi(Dio dio, {String baseUrl}) = _DriverReferApi;

  @GET("${ApiRoutes.parent}/users/{userId}/referralCode")
  Future<RequiredDataDriverReferResponse> api(@Path("userId") String userId);
}