import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_trips_details_response.dart';
import 'package:retrofit/http.dart';


part 'trips_transaction_api.g.dart';

@RestApi()
abstract class TripsTransactionApi{
  factory TripsTransactionApi(Dio dio, {String? baseUrl}) = _TripsTransactionApi;

  @GET("${ApiRoutes.parent}/users/{userId}/trips")
  Future<TripsTransactionResponse> tripsdetail(
      @Path("userId") String userInputId,
      @Query("date") String selected
      );
}