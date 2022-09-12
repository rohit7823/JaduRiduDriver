import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/driver_status_model.dart';
import 'package:jadu_ride_driver/core/domain/response/driver_status_response.dart';
import 'package:jadu_ride_driver/core/domain/response/set_driver_status_response.dart';
import 'package:jadu_ride_driver/core/domain/response/short_bookings_summary_response.dart';
import 'package:jadu_ride_driver/core/domain/short_bookings_summary.dart';
import 'package:jadu_ride_driver/core/repository/driver_duty_repository.dart';

class DriverDutyRepositoryImpl implements DriverDutyRepository {
  @override
  Future<Resource<DriverStatusResponse>> driverStatus(String userId) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(DriverStatusResponse(
        status: true,
        message: "Message",
        driverStatus: DriverStatusModel(id: "DriverStatus", status: DriverStatus.offDuty.name)
    ));
  }

  @override
  Future<Resource<ShortBookingsSummaryResponse>> bookingsSummary(String userId) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(ShortBookingsSummaryResponse(
        status: true,
        message: "Success",
        bookingsSummary: ShortBookingsSummary(
            bookingCount: "0",
            totalIncome: "0.0",
            timeStamp: "Thus, 01 Jun 22, 06:37 PM"
        )
    ));
  }

  @override
  Future<Resource<SetDriverStatusResponse>> setStatus(String userId, String status) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(SetDriverStatusResponse(
        status: true,
        message: "Success",
        isUpdated: true
    ));
  }

}