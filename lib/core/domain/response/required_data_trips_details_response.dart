
// import '../trips_details.dart';
// import 'business_object.dart';
//
// class RequiredDataTripsDetailsResponse extends BusinessObject{
//   bool status;
//   String message;
//   List<TripsDetails> tripsDetailsList;
//
//   RequiredDataTripsDetailsResponse({
//     required this.status,
//     required this.message,
//     required this.tripsDetailsList});
// }


import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/trips_details.dart';

TripsTransactionResponse tripsTransactionResponseFromJson(String str) => TripsTransactionResponse.fromJson(json.decode(str));

String tripsTransactionResponseToJson(TripsTransactionResponse data) => json.encode(data.toJson());

class TripsTransactionResponse  extends BusinessObject{
  TripsTransactionResponse({
    required this.status,
    required this.message,
    required this.trips,
  });

  final bool status;
  final String message;
  final List<Trip> trips;

  factory TripsTransactionResponse.fromJson(Map<String, dynamic> json) => TripsTransactionResponse(
    status: json["status"],
    message: json["message"],
    trips: List<Trip>.from(json["trips"].map((x) => Trip.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "trips": List<dynamic>.from(trips.map((x) => x.toJson())),
  };
}
