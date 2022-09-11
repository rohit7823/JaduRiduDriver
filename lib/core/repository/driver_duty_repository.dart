import 'package:jadu_ride_driver/core/common/response.dart';

import '../domain/response/driver_status_response.dart';

abstract class DriverDutyRepository {
  Future<Resource<DriverStatusResponse>> driverStatus(String userId);
}