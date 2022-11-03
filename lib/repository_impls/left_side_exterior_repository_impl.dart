import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_exterior_response.dart';
import 'package:jadu_ride_driver/core/repository/left_side_exterior_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/left_side_exterior_api.dart';

class LeftSideExteriorRepositoryImpl implements LeftSideExteriorRepository {
  final Dio _dio;
  late final LeftSideExteriorApi _leftSideExteriorApi;

  LeftSideExteriorRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _leftSideExteriorApi = LeftSideExteriorApi(_dio);
  }

  @override
  Future<Resource<UploadExteriorResponse>> uploadLeftSideExterior(String userId,
      File leftSideExterior, Function(int p1, int p2) uploading) async {
    return _leftSideExteriorApi
        .upload(userId, leftSideExterior, uploading)
        .handleResponse<UploadExteriorResponse>();

    /*var size = await leftSideExterior.length();
    uploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    uploading(false, 0);
    return Success(UploadExteriorResponse(
        status: true, message: "Success", isUploaded: true));*/
  }
}
