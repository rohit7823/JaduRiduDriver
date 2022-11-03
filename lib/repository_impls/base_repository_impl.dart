import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/batch_call_apis.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/batch_call_response.dart';
import 'package:jadu_ride_driver/core/domain/response/driver_account_status_response.dart';
import 'package:jadu_ride_driver/core/repository/base_repository.dart';
import 'package:jadu_ride_driver/data/online/batch_call_api.dart';
import 'package:jadu_ride_driver/data/online/driver_account_status_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class BaseRepositoryImpl implements BaseRepository {
  final Dio _dio;
  late final BatchCallApi _batchCallApi;
  late final DriverAccountStatusApi _driverAccountStatusApi;

  BaseRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _batchCallApi = BatchCallApi(_dio);
    _driverAccountStatusApi = DriverAccountStatusApi(_dio);
  }

  @override
  Future<Resource<BatchCallResponse>> getIntroPageData() async {
    return await _batchCallApi
        .batchCallForIntroData(BatchCallApis.introPageData.value)
        .handleResponse<BatchCallResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(
        BatchCallResponse(status: true, message: "Success", responses: [
      IntroDataResponse(status: true, message: "Success", introData: [
        IntroData(
            id: "443671",
            heading: "Lorem Ipsum",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet.",
            coverImage: "assets/images/book_delivery.svg"),
        IntroData(
            id: "032481",
            heading: "Lorem Ipsum",
            body:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet.",
            coverImage: "assets/images/book_delivery.svg"),
      ])
    ]));*/
  }

  @override
  Future<Resource<BatchCallResponse>> getLRPageData() async {
    return await _batchCallApi
        .batchCallForRegistrationData(BatchCallApis.registrationPageData.value)
        .handleResponse<BatchCallResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(
        BatchCallResponse(status: true, message: "Success", responses: [
      LoginRegisterDataResponse(
          status: true,
          message: "Success",
          data: LoginRegistrationData(
              coverImage:
                  "https://jaduridedev.v-xplore.com/assets/images/book_delivery.svg",
              heading: "Lorem Ipsum",
              description:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."))
    ]));*/
  }

  @override
  Future<Resource<DriverAccountStatusResponse>> driverAccountStatus(
      String deviceID) async {
    return _driverAccountStatusApi
        .accountStatus()
        .handleResponse<DriverAccountStatusResponse>();
  }
}
