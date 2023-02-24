import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/razorpay_necssary_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_driver_license_response.dart';
import 'package:jadu_ride_driver/core/domain/step.dart';
import 'package:jadu_ride_driver/core/repository/driver_license_repository.dart';
import 'package:jadu_ride_driver/data/online/prefill_details_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/driver_license_api.dart';

class DriverLicenseRepositoryImpl implements DriverLicenseRepository {
  final Dio _dio;
  late final DriverLicenseApi _driverLicenseApi;
  late final PrefillDetailsApi _prefillApi;

  DriverLicenseRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _driverLicenseApi = DriverLicenseApi(_dio);
    _prefillApi = PrefillDetailsApi(_dio);
  }

  @override
  Future<Resource<UploadDriverLicenseResponse>> uploadLicense(
      String userId,
      String number,
      File license,
      String expiryDate,
      Function(int, int) onUploading) async {
    return await _driverLicenseApi
        .driverLicense(userId, number, license, expiryDate, onUploading)
        .handleResponse<UploadDriverLicenseResponse>();

    /*var size = await license.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadDriverLicenseResponse(
        status: true, message: "Success", isUploaded: true));*/
  }

  @override
  Future<MasterResponse> setData(String userId) {
    return _prefillApi.prefillDetails(userId, DetailsStepKey.driverLicense.key);
  }
}
