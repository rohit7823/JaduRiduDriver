import 'dart:async';

import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/domain/ride_canceled_response.dart';
import 'package:jadu_ride_driver/core/domain/ride_navigation_data.dart';

import '../domain/ride_location_response.dart';

abstract class RideNavigationRepository {
  //StreamController<Object> ride(RideNavigationData ids);
  updateCurrentLocation(String rideId,LatLong latLong, String customerId, String userId);
  StreamController<RideCanceledResponse> onCancelRide();
  StreamController<dynamic> clientLocated();
  onRide(String rideInstruction, String rideId);

}
