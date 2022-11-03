import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_exterior_response.dart';
import 'package:jadu_ride_driver/core/repository/right_side_exterior_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/right_side_exterior_api.dart';

class RightSideExteriorRepositoryImpl implements RightSideExteriorRepository {
  final Dio _dio;
  late final RightSideExteriorApi _rightSideExteriorApi;

  RightSideExteriorRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _rightSideExteriorApi = RightSideExteriorApi(_dio);
  }

  @override
  Future<Resource<UploadExteriorResponse>> uploadRightExterior(String userId,
      File rightSideExterior, Function(int p1, int p2) uploading) async {
    return _rightSideExteriorApi
        .upload(userId, rightSideExterior, uploading)
        .handleResponse<UploadExteriorResponse>();

    /*var size = await rightSideExterior.length();
    uploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    uploading(false, 0);
    return Success(UploadExteriorResponse(
        status: true, message: "Success", isUploaded: true));*/
  }
}
