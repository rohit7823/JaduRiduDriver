
import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_accounts_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_short_detail_response.dart';
import 'package:retrofit/http.dart';


import 'package:dio/dio.dart';
part 'short_profile_api.g.dart';

@RestApi()
abstract class ProfileShortApi {
  factory ProfileShortApi(Dio dio, {String? baseUrl}) = _ProfileShortApi;

  @GET("${ApiRoutes.parent}/users/{userId}/shortDetails")
  Future<ShortProfileDetailResponse> shortdetails(@Path("userId") String userId);

}