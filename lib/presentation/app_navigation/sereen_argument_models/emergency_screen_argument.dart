import 'package:geolocator/geolocator.dart';
import 'package:jadu_ride_driver/core/domain/emergency_place.dart';

class EmergencyScreenArgument {
  Position currentLocation;
  List<EmergencyPlace> emergencyPlaces;

  EmergencyScreenArgument(
      {required this.currentLocation, required this.emergencyPlaces});
}
