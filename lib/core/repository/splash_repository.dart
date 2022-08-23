import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/app_version_response.dart';
import 'package:jadu_ride_driver/core/domain/response/base_url_response.dart';

abstract class SplashRepository {
  Future<Resource<AppVersionResponse>> fetchAppVersion();
  Future<Resource<BaseUrlResponse>> getBaseUrl();
}
