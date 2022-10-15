import 'dart:async';

import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/domain/ride_canceled_response.dart';
import 'package:jadu_ride_driver/core/domain/ride_id.dart';

abstract class RideNavigationRepository {
  //StreamController<Object> ride(RideNavigationData ids);
  updateCurrentLocation(LatLong latLong, String customerId, String userId);
  StreamController<RideCanceledResponse> onCancelRide();
}
