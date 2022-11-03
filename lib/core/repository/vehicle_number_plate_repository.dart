import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';

import '../domain/response/upload_vehicle_number_plate_response.dart';

abstract class VehicleNumberPlateRepository {
  Future<Resource<UploadVehicleNumberPlateResponse>> uploadNumberPlate(
      String userId, File numberPlate, Function(int, int) onUploading);
}
