import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/driver_status_model.dart';
import 'package:jadu_ride_driver/core/domain/response/driver_status_response.dart';
import 'package:jadu_ride_driver/core/repository/driver_duty_repository.dart';

class DriverDutyRepositoryImpl implements DriverDutyRepository {
  @override
  Future<Resource<DriverStatusResponse>> driverStatus(String userId) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(DriverStatusResponse(
        status: true,
        message: "Message",
        driverStatus: DriverStatusModel(id: "DriverStatus", status: DriverStatus.onDuty.name)
    ));
  }

}