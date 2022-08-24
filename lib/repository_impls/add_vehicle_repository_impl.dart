import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/initial_data_in_add_vehicle_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_vehicle_response.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_category.dart';
import 'package:jadu_ride_driver/core/repository/add_vehicle_repository.dart';

class AddVehicleRepositoryImpl implements AddVehicleRepository {
  @override
  Future<Resource<InitialDataInAddVehicleResponse>> initialData() async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(InitialDataInAddVehicleResponse(
        status: true,
        message: "Success",
        categories: List.generate(
            10,
            (index) => VehicleCategory(
                id: "ID${index + 1}", name: "Vehicle type ${index + 1}"))));
  }

  @override
  Future<Resource<UserVehicleResponse>> addVehicle(
      String userId, String vehicleTypeId, String number) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(
        UserVehicleResponse(status: true, messsage: "Success", isAdded: true));
  }
}
