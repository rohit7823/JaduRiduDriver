import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/domain/response/location_schedule_response.dart';

part 'schedule_trips_api.g.dart';

@RestApi()
abstract class ScheduleTripsApi {
    factory ScheduleTripsApi(Dio dio, {String baseUrl}) = _ScheduleTripsApi;


    @GET("${ApiRoutes.parent}/users/{userId}/scheduleRides")
    Future<LocationScheduleResponse> api(@Path("userId") String userId);
}