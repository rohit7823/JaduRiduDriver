import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/customer_waiting_timer.dart';

ClientWaitingResponse clientWaitingResponseFromJson(String str) =>
    ClientWaitingResponse.fromJson(json.decode(str));

String clientWaitingResponseToJson(ClientWaitingResponse data) =>
    json.encode(data.toJson());

class ClientWaitingResponse {
  ClientWaitingResponse({required this.rideStage, required this.clientTimer});

  String rideStage;
  CustomerWaitingTimer clientTimer;

  factory ClientWaitingResponse.fromJson(Map<String, dynamic> json) =>
      ClientWaitingResponse(
        rideStage: json["rideStage"],
        clientTimer:
            CustomerWaitingTimer.fromJson(json["waitingTime"]), //"waitingTime"
      );

  Map<String, dynamic> toJson() => {
        "rideStage": rideStage,
        "clientTimer": clientTimer.toJson(),
      };
}
