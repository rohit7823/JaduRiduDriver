import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideId {
  String tripId;
  String driverId;
  String customerId;
  LatLng currentLocation;

  RideId(
      {required this.tripId,
      required this.driverId,
      required this.customerId,
      required this.currentLocation});
}
