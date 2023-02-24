import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/driver_status_response.dart';
import 'package:jadu_ride_driver/core/domain/response/set_driver_status_response.dart';
import 'package:retrofit/retrofit.dart';

part 'driver_status_api.g.dart';

@RestApi()
abstract class DriverStatusApi {
  factory DriverStatusApi(Dio dio, {String baseUrl}) = _DriverStatusApi;

  @POST("${ApiRoutes.parent}/users/{userId}/workingStatus")
  @FormUrlEncoded()
  Future<SetDriverStatusResponse> setWorkingStatus(
      @Path("userId") String userId,
      @Field("status") String status,
      @Field("goToDetails") String goToDetails);

  @GET("${ApiRoutes.parent}/users/{userId}/status/current")
  Future<DriverStatusResponse> getworkingStatus(@Path("userId") String userId);
}
