import 'package:jadu_ride_driver/core/domain/package.dart';

class CitiesResponse {
  bool status;
  String message;
  List<Package> cities;

  CitiesResponse({required this.status, required this.message, required this.cities});
}