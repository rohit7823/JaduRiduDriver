import 'package:jadu_ride_driver/core/domain/customer_waiting_timer.dart';

class ClientWaitingResponse {
  String rideStage;
  CustomerWaitingTimer clientTimer;

  ClientWaitingResponse({required this.rideStage, required this.clientTimer});
}
