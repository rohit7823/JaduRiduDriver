import 'dart:async';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';

import '../common/booking_status.dart';
import '../domain/booking_accepted.dart';

abstract class DriverBookingsRepository {
  StreamController<DriverBookingDetails> booking();
  bookingStatus(String key, String rideId, String userId);
  StreamController<BookingAccepted> onBookingAccepted();
}
