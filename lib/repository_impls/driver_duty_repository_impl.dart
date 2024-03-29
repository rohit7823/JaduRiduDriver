import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/driver_status_model.dart';
import 'package:jadu_ride_driver/core/domain/response/driver_status_response.dart';
import 'package:jadu_ride_driver/core/domain/response/set_driver_status_response.dart';
import 'package:jadu_ride_driver/core/domain/response/short_bookings_summary_response.dart';
import 'package:jadu_ride_driver/core/domain/short_bookings_summary.dart';
import 'package:jadu_ride_driver/core/repository/driver_duty_repository.dart';
import 'package:jadu_ride_driver/data/online/driver_status_api.dart';
import 'package:jadu_ride_driver/data/online/short_booking_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class DriverDutyRepositoryImpl implements DriverDutyRepository {
  final Dio _dio;
  late final DriverStatusApi _driverStatusApi;
  late final ShortBookingsApi _shortBookingsApi;

  DriverDutyRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _driverStatusApi = DriverStatusApi(_dio);
    _shortBookingsApi = ShortBookingsApi(_dio);
  }

  @override
  Future<Resource<DriverStatusResponse>> driverStatus(String userId) async {
    return await _driverStatusApi
        .getworkingStatus(userId)
        .handleResponse<DriverStatusResponse>();
      }

  @override
  Future<Resource<ShortBookingsSummaryResponse>> bookingsSummary(String userId) async {
    return await _shortBookingsApi
            .bookingcount(userId)
        .handleResponse<ShortBookingsSummaryResponse>();
  }

  @override
  Future<Resource<SetDriverStatusResponse>> setStatus(
      String userId, String status, String goToDetails) async {
    var tmpStatus = status.split(" ");
    status = "${tmpStatus.first}_${tmpStatus.last}".toLowerCase();

    return _driverStatusApi
        .setWorkingStatus(userId, status, goToDetails)
        .handleResponse<SetDriverStatusResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(SetDriverStatusResponse(
        status: true, message: "Success", isUpdated: true));*/
  }
}
