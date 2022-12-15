import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/emergency_places_response.dart';
import 'package:retrofit/retrofit.dart';

part 'emergency_places_api.g.dart';

@RestApi()
abstract class EmergencyPlacesApi {
  factory EmergencyPlacesApi(Dio dio, {String? baseUrl}) = _EmergencyPlacesApi;

  @GET("${ApiRoutes.parent}/nearestHospitals")
  Future<EmergencyPlacesResponse> emergencyPlaces(
      @Query("lat") double lat, @Query("lng") double lng);
}
