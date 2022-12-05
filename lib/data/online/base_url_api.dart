import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/app_version_response.dart';
import 'package:jadu_ride_driver/core/domain/response/base_url_response.dart';
import 'package:retrofit/http.dart';

part 'base_url_api.g.dart';

@RestApi()
abstract class BaseUrlApi {
  factory BaseUrlApi(Dio dio, {String? baseUrl}) = _BaseUrlApi;

  @GET(ApiRoutes.baseUrl)
  Future<BaseUrlResponse> appBaseUrl();

  @GET(ApiRoutes.appVersion)
  Future<AppVersionResponse> appVersion();
}
