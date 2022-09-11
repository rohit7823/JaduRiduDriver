

import 'package:jadu_ride_driver/core/domain/driver_status_model.dart';

class DriverStatusResponse {
  bool status;
  String message;
  DriverStatusModel driverStatus;
  DriverStatusResponse({required this.status, required this.message, required this.driverStatus});
}