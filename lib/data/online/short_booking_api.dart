import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/short_bookings_summary_response.dart';
import 'package:retrofit/http.dart';



part 'short_booking_api.g.dart';

@RestApi()
abstract class ShortBookingsApi{
  factory ShortBookingsApi(Dio dio, {String? baseUrl}) = _ShortBookingsApi;


  @GET("${ApiRoutes.parent}/users/{userId}/booking/count")
  Future<ShortBookingsSummaryResponse> bookingcount(
      @Path("userId") String userInputId,
      );
}