import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class NotificationPayload {
  Screen screen;
  DriverBookingDetails bookingDetails;

  NotificationPayload({required this.screen, required this.bookingDetails});

  factory NotificationPayload.fromJson(Map<String, dynamic> json) =>
      NotificationPayload(
          screen: (json["screen"] as String).toScreen(),
          bookingDetails:
              DriverBookingDetails.fromJson(json["bookingDetails"])
      );
}
