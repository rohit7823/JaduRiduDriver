import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/app_version.dart';
import 'package:jadu_ride_driver/core/domain/response/app_version_response.dart';
import 'package:jadu_ride_driver/core/domain/response/base_url_response.dart';
import 'package:jadu_ride_driver/core/repository/splash_repository.dart';
import 'package:jadu_ride_driver/data/online/base_url_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class SplashRepositoryImpl implements SplashRepository {
  final Dio _dio;
  late final BaseUrlApi _baseUrlApi;

  SplashRepositoryImpl(this._dio) {
    //_dio.options = ApiClientConfiguration.initialConfiguration;
    _baseUrlApi = BaseUrlApi(_dio);
  }

  @override
  Future<Resource<AppVersionResponse>> fetchAppVersion() async {
    return await _baseUrlApi.appVersion().handleResponse<AppVersionResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(AppVersionResponse(
        status: true,
        message: "Success",
        version: AppVersion(
            message: "Version: 2.0.0",
            code: 1,
            date: "8/6/2022",
            isSkipable: false,
            url:
                'https://play.google.com/store/search?q=farmology+app&c=apps')));*/
  }

  @override
  Future<Resource<BaseUrlResponse>> getBaseUrl() async {
    var result =
        await _baseUrlApi.appBaseUrl().handleResponse<BaseUrlResponse>();

    return result;
    /*await Future.delayed(const Duration(seconds: 2));

    return Success(BaseUrlResponse(
        status: true,
        message: "Success",
        baseUrl: "https://jaduridedev.v-xplore.com/"));*/
  }
}
