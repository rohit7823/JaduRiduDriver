import 'package:jadu_ride_driver/core/domain/response/short_bookings_summary_response.dart';

class ShortBookingsSummary {
  String bookingCount;
  String totalIncome;
  String timeStamp;


  ShortBookingsSummary({required this.bookingCount, required this.totalIncome, required this.timeStamp});
}