import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DriverLiveLocationRepository {
  Future throwLiveLocation(String driverId, LatLng currentLocation);
}
