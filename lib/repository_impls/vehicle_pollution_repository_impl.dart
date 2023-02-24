import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_pollution_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_pollution_repository.dart';
import 'package:jadu_ride_driver/data/online/prefill_details_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/vehicle_pollution_api.dart';

class VehiclePollutionRepositoryImpl implements VehiclePollutionRepository {
  final Dio _dio;
  late final VehiclePollutionApi _vehiclePollutionApi;
  late final PrefillDetailsApi _prefillDetailsApi;

  VehiclePollutionRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _vehiclePollutionApi = VehiclePollutionApi(_dio);
    _prefillDetailsApi = PrefillDetailsApi(_dio);
  }

  @override
  Future<Resource<UploadVehiclePollutionResponse>> uploadPollution(
      String userId,
      String expiryDate,
      File pollutionPaper,
      Function(int p1, int p2) onUploading) async {
    return _vehiclePollutionApi
        .uploadPollution(userId, expiryDate, pollutionPaper, onUploading)
        .handleResponse<UploadVehiclePollutionResponse>();

    /*var size = await pollutionPaper.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadVehiclePollutionResponse(
        status: true, message: "Success", isSubmitted: true));*/
  }

  @override
  Future<MasterResponse> setData(String userId) => _prefillDetailsApi
      .prefillDetails(userId, DetailsStepKey.vehiclePollution.key);
}
