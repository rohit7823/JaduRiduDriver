import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_chasis_number_response.dart';
import 'package:jadu_ride_driver/core/repository/chasis_number_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/chassis_number_api.dart';

class ChasisNumberRepositoryImpl implements ChasisNumberRepository {
  final Dio _dio;
  late final ChassisNumberApi _chassisNumberApi;

  ChasisNumberRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _chassisNumberApi = ChassisNumberApi(_dio);
  }

  @override
  Future<Resource<UploadChasisNumberResponse>> uploadChasisNumber(
      String userId,
      String number,
      File chasisNumber,
      Function(int, int) uploadingProgress) async {
    return _chassisNumberApi
        .uploadChassis(userId, number, chasisNumber, uploadingProgress)
        .handleResponse<UploadChasisNumberResponse>();

    /*var size = await chasisNumber.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadChasisNumberResponse(
        status: true, message: "Success", isUploaded: true));*/
  }
}
