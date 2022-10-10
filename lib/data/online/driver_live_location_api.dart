import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:retrofit/retrofit.dart';

part "driver_live_location_api.g.dart";

@RestApi()
abstract class DriverLiveLocationApi {
  factory DriverLiveLocationApi(Dio dio, {String baseUrl}) =
      _DriverLiveLocationApi;

  @PUT("${ApiRoutes.parent}/users/{userId}/currentLocation")
  Future<void> sendLiveLocation(
      @Path("userId") String userId, @Body() LatLong currentLocation);
}
