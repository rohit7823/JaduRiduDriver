import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/domain/ride_initiate_data.dart';

class RideNavigationData {
  String tripId;
  String driverId;
  String customerId;
  LatLng currentLocation;
  RideInitiateData data;

  RideNavigationData(
      {required this.tripId,
      required this.driverId,
      required this.customerId,
        required this.data,
      required this.currentLocation});
}
