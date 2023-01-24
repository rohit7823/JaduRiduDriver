import '../common/response.dart';
import '../domain/response/location_schedule_response.dart';

abstract class ScheduleRepository{
  Future<Resource<LocationScheduleResponse>> getScheduleResponse(String userId);
}