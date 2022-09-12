import 'package:jadu_ride_driver/core/domain/short_bookings_summary.dart';

class ShortBookingsSummaryResponse {
  bool status;
  String message;
  ShortBookingsSummary bookingsSummary;

  ShortBookingsSummaryResponse({required this.status, required this.message, required this.bookingsSummary});
}