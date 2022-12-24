import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/response.dart';
import '../domain/response/confirm_ride_response.dart';

abstract class EmergencyPlaceRepository {
  Future<Resource<ConfirmRideResponse>> initiateRide(
    LatLng from,
    LatLng to,
    List<LatLng> wayPoints,
    String service,
    String userId,
  );
}
