import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

String locationRequestToJson(LocationRequest data) =>
    json.encode(data.toJson());

class LocationRequest {
  LatLng origin;
  LatLng destination;
  List<LatLng> waypoints;

  LocationRequest(
      {required this.origin,
      required this.destination,
      required this.waypoints});

  Map<String, dynamic> toJson() => {
        "origin": origin.toJsonFormat(),
        "destination": destination.toJsonFormat(),
        "waypoints": waypoints.toJsonFormat()
      };
}
