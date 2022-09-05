import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_pollution_response.dart';

abstract class VehiclePollutionRepository {
  Future<Resource<UploadVehiclePollutionResponse>> uploadPollution(
      String userId,
      String expiryDate,
      File pollutionPaper, Function(bool, int) onUploading);
}