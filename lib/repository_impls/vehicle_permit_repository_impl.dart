import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_permit_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_permit_repository.dart';
import 'package:jadu_ride_driver/data/online/vehicle_permit_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class VehiclePermitRepositoryImpl implements VehiclePermitRepository {
  final Dio _dio;
  late final VehiclePermitApi _vehiclePermitApi;

  VehiclePermitRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _vehiclePermitApi = VehiclePermitApi(_dio);
  }

  @override
  Future<Resource<UploadVehiclePermitResponse>> uploadPermit(
      String userId,
      String number,
      String issueDate,
      String isIssued,
      File vehiclePermit,
      Function(int p1, int p2) onUploading) async {
    return await _vehiclePermitApi
        .vehiclePermit(
            userId, number, vehiclePermit, issueDate, isIssued, onUploading)
        .handleResponse<UploadVehiclePermitResponse>();

    /*var size = await vehiclePermit.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadVehiclePermitResponse(
        status: true, message: "Success", isUploaded: true));*/
  }
}
