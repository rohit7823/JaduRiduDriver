import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/batch_call_response.dart';

import '../domain/response/driver_account_status_response.dart';

abstract class BaseRepository {
  Future<Resource<BatchCallResponse>> getIntroPageData();
  Future<Resource<BatchCallResponse>> getLRPageData();
  Future<Resource<DriverAccountStatusResponse>> driverAccountStatus(
      String deviceID);
}
