import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_inside_car_response.dart';
import 'package:jadu_ride_driver/core/repository/car_inside_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/car_inside_api.dart';

class CarInsideRepositoryImpl implements CarInsideRepository {
  final Dio _dio;
  late final CarInsideApi _carInsideApi;

  CarInsideRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _carInsideApi = CarInsideApi(_dio);
  }

  @override
  Future<Resource<UploadInsideCarResponse>> uploadInsideCar(
      String userId, File carInside, Function(int p1, int p2) uploading) async {
    return _carInsideApi
        .upload(userId, carInside, uploading)
        .handleResponse<UploadInsideCarResponse>();

    /*var size = await carInside.length();
    uploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    uploading(false, 0);
    return Success(UploadInsideCarResponse(
        status: true, message: "Success", isUploaded: true));*/
  }
}
