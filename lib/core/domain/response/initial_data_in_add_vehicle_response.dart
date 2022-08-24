import 'package:jadu_ride_driver/core/domain/vehicle_category.dart';

class InitialDataInAddVehicleResponse {
  bool status;
  String message;
  List<VehicleCategory> categories;

  InitialDataInAddVehicleResponse(
      {required this.status, required this.message, required this.categories});
}
