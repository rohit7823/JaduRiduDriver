import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/add_car_response.dart';
import 'package:jadu_ride_driver/core/domain/response/initial_data_in_add_vehicle_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_vehicle_response.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_category.dart';
import 'package:jadu_ride_driver/core/repository/add_vehicle_repository.dart';
import 'package:jadu_ride_driver/data/online/add_vehicle_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class AddVehicleRepositoryImpl implements AddVehicleRepository {
  final Dio _dio;
  late final AddVehicleApi _addVehicleApi;

  AddVehicleRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _addVehicleApi = AddVehicleApi(_dio);
  }

  @override
  Future<Resource<InitialDataInAddVehicleResponse>> initialData() async {
    return await _addVehicleApi
        .vehicleTypes()
        .handleResponse<InitialDataInAddVehicleResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(InitialDataInAddVehicleResponse(
        status: true,
        message: "Success",
        categories: List.generate(
            10,
            (index) => VehicleCategory(
                id: "ID${index + 1}", name: "Vehicle type ${index + 1}"))));*/
  }

  @override
  Future<Resource<UserVehicleResponse>> addVehicle(
      String userId, String vehicleTypeId, String carId, String number) async {
    return await _addVehicleApi
        .addVehicle(userId, vehicleTypeId, carId, number)
        .handleResponse<UserVehicleResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(
        UserVehicleResponse(status: true, message: "Success", isAdded: true));*/
  }

  @override
  Future<Resource<CarResponse>> addCar(
      String selectedCategoryId) async {
        return _addVehicleApi
          .car(selectedCategoryId)
           .handleResponse<CarResponse>();

  }

}
