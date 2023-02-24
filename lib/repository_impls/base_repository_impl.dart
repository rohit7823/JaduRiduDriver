import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/batch_call_apis.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/expired_document_alert.dart';
import 'package:jadu_ride_driver/core/domain/response/batch_call_response.dart';
import 'package:jadu_ride_driver/core/domain/response/driver_account_status_response.dart';
import 'package:jadu_ride_driver/core/domain/response/emergency_places_response.dart';
import 'package:jadu_ride_driver/core/domain/response/expired_document_alert_response.dart';
import 'package:jadu_ride_driver/core/domain/response/fcm_token_response.dart';
import 'package:jadu_ride_driver/core/repository/base_repository.dart';
import 'package:jadu_ride_driver/data/online/alert_api.dart';
import 'package:jadu_ride_driver/data/online/batch_call_api.dart';
import 'package:jadu_ride_driver/data/online/driver_account_status_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/emergency_places_api.dart';
import '../data/online/fcm_token_api.dart';

class BaseRepositoryImpl implements BaseRepository {
  final Dio _dio;
  late final BatchCallApi _batchCallApi;
  late final FCMTokenApi _fcmTokenApi;
  late final DriverAccountStatusApi _driverAccountStatusApi;
  late final EmergencyPlacesApi _emergencyPlacesApi;
  late final AlertApi _alertApi;

  BaseRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _batchCallApi = BatchCallApi(_dio);
    _fcmTokenApi = FCMTokenApi(_dio);
    _alertApi = AlertApi(_dio);
    _driverAccountStatusApi = DriverAccountStatusApi(_dio);
    _emergencyPlacesApi = EmergencyPlacesApi(_dio);
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

  @override
  Future<Resource<FcmTokenResponse>> sendTokenToServer(
      String userId, String token) {
    return _fcmTokenApi
        .sendToken(userId, token)
        .handleResponse<FcmTokenResponse>();
  }

  @override
  Future<Resource<EmergencyPlacesResponse>> emergencyPlaces(
      LatLong currentLocation) async {
    return await _emergencyPlacesApi
        .emergencyPlaces(currentLocation.lat, currentLocation.lng)
        .handleResponse<EmergencyPlacesResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(EmergencyPlacesResponse(
        status: true,
        message: "Success",
        places: List.generate(
            5,
            (index) => EmergencyPlace(
                name: "Emergency Place ${index + 1}",
                types: List.generate(index + 1, (index) => "Type ${index + 1}"),
                id: "ID${index + 1}",
                icon: "",
                address: "Address ${index + 1}",
                coordinates: LatLong(
                    lat: Random().nextDouble().ceilToDouble(),
                    lng: Random().nextDouble().ceilToDouble()),
                isOpen: index.isEven ? false : true))));*/
  }

  @override
  Future<Resource<ExpiredDocumentAlertResponse>> giveAlert(
      String userId) async {
    return _alertApi
        .giveAlert(userId)
        .handleResponse<ExpiredDocumentAlertResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(ExpiredDocumentAlertResponse(
        status: true,
        message: "Success",
        documentAlert: ExpiredDocumentAlert(
          message: "asdafsa",
          isSkippable: false,
          giveAlert: false,
          key: DetailsStepKey.driverLicense.key
        )
    ));*/
  }
}
