
import '../location_schedule.dart';

class LocationScheduleResponse{
  bool status;
  String message;
  List<LocationSchedule> scheduleList;

  LocationScheduleResponse({required this.status,
    required this.message,
    required this.scheduleList});
}