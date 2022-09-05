import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_aadhar_response.dart';
import 'package:jadu_ride_driver/core/repository/aadhar_number_repository.dart';
import 'package:jadu_ride_driver/data/online/aadhar_number_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class AadharNumberRepositoryImpl implements AadharNumberRepository {
  final Dio _dio;
  late final AadharNumberApi _aadharNumberApi;

  AadharNumberRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _aadharNumberApi = AadharNumberApi(_dio);
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
}
