import 'package:jadu_ride_driver/core/domain/package.dart';

class DistrictsResponse {
  bool status;
  String message;
  List<Package> districts;

  DistrictsResponse({
    required this.status,
    required this.message,
    required this.districts});
}