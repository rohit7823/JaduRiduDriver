
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/location_schedule_response.dart';

import '../core/domain/location_schedule.dart';
import '../core/repository/schedule_repository.dart';

class LocationSchedulRepositoryImpl implements ScheduleRepository{
  @override
  Future<Resource<LocationScheduleResponse>> getScheduleResponse(String userId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Success(LocationScheduleResponse(status: true, message: "Success", scheduleList: List.generate(5, (index) =>
        LocationSchedule(date: "Monday 18th June , 2022", time: "12:15 PM", pickUpLocation: "Howrah Railway Station", dropLocation: "V-xplore Technologies", rideId: "123"))));
  }

}