import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../domain/ride_location_response.dart';

abstract class DriverLiveLocationRepository {
  Future throwLiveLocation(String driverId, LatLng currentLocation);
  StreamController<RideLocationResponse> onRideStarted();
}
