import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/add_car_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_vehicle_response.dart';

import '../domain/response/initial_data_in_add_vehicle_response.dart';

abstract class AddVehicleRepository {
  Future<Resource<InitialDataInAddVehicleResponse>> initialData();
  Future<Resource<UserVehicleResponse>> addVehicle(
      String userId, String vehicleTypeId, String number);
  Future<Resource<CarResponse>> addCar(String id);
}
