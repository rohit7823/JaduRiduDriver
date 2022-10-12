import 'dart:async';

import 'package:jadu_ride_driver/core/domain/ride_id.dart';

abstract class RideNavigationRepository {
  StreamController<Object> ride(RideId ids);
}
