import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_permit_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_pollution_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_permit_repository.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_pollution_repository.dart';

class VehiclePollutionRepositoryImpl implements VehiclePollutionRepository {
  @override
  Future<Resource<UploadVehiclePollutionResponse>> uploadPollution(String userId, String expiryDate, File pollutionPaper, Function(bool p1, int p2) onUploading) async {
    var size = await pollutionPaper.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadVehiclePollutionResponse(
        status: true,
        message: "Success",
        isSubmitted: false
    ));
  }

}