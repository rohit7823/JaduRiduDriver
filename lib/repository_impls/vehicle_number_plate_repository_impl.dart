import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_number_plate_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_number_plate_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/number_plate_api.dart';

class VehicleNumberPlateRepositoryImpl implements VehicleNumberPlateRepository {
  final Dio _dio;
  late final NumberPlateApi _numberPlateApi;

  VehicleNumberPlateRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _numberPlateApi = NumberPlateApi(_dio);
  }

  @override
  Future<Resource<UploadVehicleNumberPlateResponse>> uploadNumberPlate(
      String userId,
      File numberPlate,
      Function(int p1, int p2) onUploading) async {
    return _numberPlateApi
        .upload(userId, numberPlate, onUploading)
        .handleResponse<UploadVehicleNumberPlateResponse>();
    /*var size = await numberPlate.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadVehicleNumberPlateResponse(
        status: true, message: "Success", isUploading: true));*/
  }
}
