import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_vehicle_number_plate_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_number_plate_repository.dart';

class VehicleNumberPlateRepositoryImpl implements VehicleNumberPlateRepository {
  @override
  Future<Resource<UploadVehicleNumberPlateResponse>> uploadNumberPlate(
      String userId,
      File numberPlate,
      Function(bool p1, int p2) onUploading) async {
    var size = await numberPlate.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadVehicleNumberPlateResponse(
        status: true, message: "Success", isUploading: true));
  }
}
