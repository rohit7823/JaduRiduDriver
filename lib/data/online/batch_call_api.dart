import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/batch_call_response.dart';
import 'package:retrofit/http.dart';

part 'batch_call_api.g.dart';

@RestApi()
abstract class BatchCallApi {
  factory BatchCallApi(Dio dio, {String baseUrl}) = _BatchCallApi;

  @GET("${ApiRoutes.parent}/batchCall")
  Future<BatchCallResponse> batchCallForIntroData(
      @Query("requested_api") String requestedApi);

  @GET("${ApiRoutes.parent}/batchCall")
  Future<BatchCallResponse> batchCallForRegistrationData(
      @Query("requested_api") String requestedApi);
}
