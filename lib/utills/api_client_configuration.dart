import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '../core/common/app_constants.dart';
import '../modules/app_module.dart';
import 'environment.dart';
import 'global.dart';

class ApiClientConfiguration {
  ApiClientConfiguration._();

  static String? _deviceId;
  static String? _staticBaseUrl;
  static String? _apiKey;

  static init(String apiKey, String staticBaseUrl) async {
    _deviceId = await PlatformDeviceId.getDeviceId;
    _staticBaseUrl = staticBaseUrl;
    _apiKey = apiKey;
  }

  static BaseOptions initialConfiguration = BaseOptions(
      baseUrl: _staticBaseUrl ?? "",
      followRedirects: true,
      connectTimeout: 10000,
      contentType: "application/json",
      responseType: ResponseType.json,
      headers: {
        AppConstants.xApiKey: _apiKey ?? "",
        AppConstants.platform: Global.getPlatform(),
        AppConstants.deviceId: _deviceId
      });

  static BaseOptions mainConfiguration = BaseOptions(
      baseUrl: dependency<Storage>().baseUrl(),
      followRedirects: true,
      contentType: "application/json",
      connectTimeout: 10000,
      headers: {
        AppConstants.xApiKey: _apiKey ?? "",
        AppConstants.platform: Global.getPlatform(),
        AppConstants.deviceId: _deviceId
      });
}
