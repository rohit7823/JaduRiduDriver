import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_permit_response.dart';

abstract class VehiclePermitRepository {

  Future<MasterResponse> setData(String userId);

  Future<Resource<UploadVehiclePermitResponse>> uploadPermit(
      String userId,
      String number,
      String issueDate,
      String isIssued,
      File vehiclePermit,
      Function(int, int) onUploading);
}
