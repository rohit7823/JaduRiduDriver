import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/set_driver_status_response.dart';
import 'package:jadu_ride_driver/core/domain/response/short_bookings_summary_response.dart';

import '../domain/response/driver_status_response.dart';

abstract class DriverDutyRepository {
  Future<Resource<DriverStatusResponse>> driverStatus(String userId);
  Future<Resource<SetDriverStatusResponse>> setStatus(String userId, String status);
  Future<Resource<ShortBookingsSummaryResponse>> bookingsSummary(String userId);
}