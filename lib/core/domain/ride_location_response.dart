import 'dart:convert';

import 'package:jadu_ride_driver/core/common/lat_long.dart';

RideLocationResponse rideLocationResponseFromJson(String str) =>
    RideLocationResponse.fromJson(json.decode(str));

String rideLocationResponseToJson(RideLocationResponse data) =>
    json.encode(data.toJson());

class RideLocationResponse {
  //String rideState;
  List<LatLong> waypoints;
  LatLong destination;

  RideLocationResponse(
      { //required this.rideState,
      required this.destination,
      required this.waypoints});

  factory RideLocationResponse.fromJson(Map<String, dynamic> json) =>
      RideLocationResponse(
        waypoints: List<LatLong>.from(
            json["waypoints"].map((x) => LatLong.fromJson(x))),
        destination: LatLong.fromJson(json["destination"]),
      );

  Map<String, dynamic> toJson() => {
        "waypoints": List<dynamic>.from(waypoints.map((x) => x.toJson())),
        "destination": destination.toJson(),
      };
}
