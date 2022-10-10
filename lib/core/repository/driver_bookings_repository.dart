import 'dart:async';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';

abstract class DriverBookingsRepository {
  StreamController<DriverBookingDetails> booking();
}
