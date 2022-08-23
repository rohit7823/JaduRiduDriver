import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/cities_response.dart';
import 'package:jadu_ride_driver/core/domain/response/districts_response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_welcome_jadu_ride_response.dart';

abstract class WelcomeJaduRideRepository {
  Future<Resource<RequiredDataWelcomeJaduRideResponse>> getInitialData(String userId);
  Future<Resource<DistrictsResponse>> districts(String selectedStateId);
  Future<Resource<CitiesResponse>> cities(String selectedDistrictId);
}