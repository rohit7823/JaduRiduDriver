import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/driver_account_status_response.dart';
import 'package:retrofit/http.dart';

part 'driver_account_status_api.g.dart';

@RestApi()
abstract class DriverAccountStatusApi {
  factory DriverAccountStatusApi(Dio dio, {String baseUrl}) =
      _DriverAccountStatusApi;

  @GET("${ApiRoutes.parent}/driverAccountStatus")
  Future<DriverAccountStatusResponse> accountStatus();
}
