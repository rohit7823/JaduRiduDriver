import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'driver_license_api.g.dart';

@RestApi()
abstract class DriverLicenseApi {
  factory DriverLicenseApi(Dio dio, {String? baseUrl}) = _DriverLicenseApi;
}
