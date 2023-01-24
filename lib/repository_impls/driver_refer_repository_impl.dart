import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_driver_refer_response.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/repository/driver_refer_repository.dart';
import '../data/online/driver_refer_api.dart';
import '../utills/api_client_configuration.dart';

class DriverReferRepositoryImpl extends DriverReferRepository {
  final Dio _dio;
  late final DriverReferApi _refer;

  DriverReferRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _refer = DriverReferApi(_dio);
  }

  @override
  Future<Resource<RequiredDataDriverReferResponse>> getDriverReferInittialData(
      String userId) async {
    return _refer.api(userId).handleResponse<RequiredDataDriverReferResponse>();

    /*await Future.delayed(
        const Duration(seconds: 2)); //RequiredDataDriverReferResponse
    return Success(RequiredDataDriverReferResponse(
        status: true,
        message: "Success",
        driverRefers: DriverRefer(
            driverToCustomar: 50,
            driverToDriver: 80,
            driverToCustomarReferCode: "SEGFERFYUF",
            driverToDriverReferCode: "ABCDEFGHIJ")));*/
  }
}
