import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_aadhar_response.dart';
import 'package:jadu_ride_driver/core/repository/aadhar_number_repository.dart';
import 'package:jadu_ride_driver/data/online/aadhar_number_api.dart';
import 'package:jadu_ride_driver/data/online/prefill_details_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class AadharNumberRepositoryImpl implements AadharNumberRepository {
  final Dio _dio;
  late final AadharNumberApi _aadharNumberApi;
  late final PrefillDetailsApi _prefillDetailsApi;

  AadharNumberRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _aadharNumberApi = AadharNumberApi(_dio);
    _prefillDetailsApi = PrefillDetailsApi(_dio);
  }

  @override
  Future<Resource<UploadAadharResponse>> uploadAadhar(String userId,
      String number, File aadhar, Function(int, int) onUploading) async {
    return await _aadharNumberApi
        .driverAadhar(userId, number, aadhar, onUploading)
        .handleResponse<UploadAadharResponse>();

    /*var size = await aadhar.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 2));
    onUploading(false, 0);
    return Success(UploadAadharResponse(
        status: true, message: "Success", isUploaded: true));*/
  }

  @override
  Future<MasterResponse> setData(String userId) {
    return _prefillDetailsApi.prefillDetails(
        userId, DetailsStepKey.aadharCard.key);
  }
}
