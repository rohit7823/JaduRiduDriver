import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:retrofit/http.dart';

part 'prefill_details_api.g.dart';

@RestApi()
abstract class PrefillDetailsApi {
  factory PrefillDetailsApi(Dio dio, {String? baseUrl}) = _PrefillDetailsApi;

  @GET("${ApiRoutes.parent}/driver/users/{userId}/document")
  Future<MasterResponse> prefillDetails(
      @Path("userId") String userId,
      @Query("key") String key);
}