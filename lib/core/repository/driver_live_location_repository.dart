import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/response/total_ride_fare_response.dart';
import '../domain/ride_location_response.dart';

abstract class DriverLiveLocationRepository {
  Future throwLiveLocation(String driverId, LatLng currentLocation);
  StreamController<RideLocationResponse> onRideStarted();

  StreamController<TotalRideFareResponse> onRideFare();
}
