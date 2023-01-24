import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/location_schedule_response.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/domain/location_schedule.dart';
import '../core/repository/schedule_repository.dart';
import '../data/online/schedule_trips_api.dart';
import '../utills/api_client_configuration.dart';

class LocationSchedulRepositoryImpl implements ScheduleRepository {
  final Dio _dio;
  late final ScheduleTripsApi _api;

  LocationSchedulRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _api = ScheduleTripsApi(_dio);
  }

  @override
  Future<Resource<LocationScheduleResponse>> getScheduleResponse(
      String userId) async {
    return _api.api(userId).handleResponse<LocationScheduleResponse>();

    /*await Future.delayed(const Duration(seconds: 1));
    return Success(LocationScheduleResponse(
        status: true,
        message: "Success",
        scheduleList: List.generate(
            5,
            (index) => LocationSchedule(
                date: "Monday 18th June , 2022",
                time: "12:15 PM",
                pickUpLocation: "Howrah Railway Station",
                dropLocation: "V-xplore Technologies",
                rideId: "123"))));*/
  }
}
