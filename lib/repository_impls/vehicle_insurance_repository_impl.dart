import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_insurance_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_insurance_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/vehicle_insurance_api.dart';

class VehicleInsuranceRepositoryImpl implements VehicleInsuranceRepository {
  final Dio _dio;
  late final VehicleInsuranceApi _vehicleInsuranceApi;
  VehicleInsuranceRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _vehicleInsuranceApi = VehicleInsuranceApi(_dio);
  }

  @override
  Future<Resource<UploadInsuranceResponse>> uploadInsurance(
      String userId,
      String number,
      String validTil,
      String validInsurance,
      File insurance,
      Function(int, int) onUploading) async {
    return await _vehicleInsuranceApi
        .addVehicleInsurance(
            userId, number, insurance, validTil, validInsurance, onUploading)
        .handleResponse<UploadInsuranceResponse>();

    /*var size = await insurance.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);

    return Success(UploadInsuranceResponse(
        status: true, message: "Success", isUploaded: true));*/
  }
}
