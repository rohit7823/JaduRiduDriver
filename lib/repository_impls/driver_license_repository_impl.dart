import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_driver_license_response.dart';
import 'package:jadu_ride_driver/core/repository/driver_license_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';

import '../data/online/driver_license_api.dart';

class DriverLicenseRepositoryImpl implements DriverLicenseRepository {
  final Dio _dio;
  late final DriverLicenseApi _driverLicenseApi;
  DriverLicenseRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _driverLicenseApi = DriverLicenseApi(_dio);
  }

  @override
  Future<Resource<UploadDriverLicenseResponse>> uploadLicense(
      String userId,
      String number,
      File license,
      String expiryDate,
      Function(bool, int) onUploading) async {
    var size = await license.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadDriverLicenseResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
