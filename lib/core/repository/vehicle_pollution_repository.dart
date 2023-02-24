import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_pollution_response.dart';

abstract class VehiclePollutionRepository {

  Future<MasterResponse> setData(String userId);

  Future<Resource<UploadVehiclePollutionResponse>> uploadPollution(
      String userId,
      String expiryDate,
      File pollutionPaper,
      Function(int, int) onUploading);
}
