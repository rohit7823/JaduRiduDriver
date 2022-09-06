import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';

import '../domain/response/upload_insurance_response.dart';

abstract class VehicleInsuranceRepository {
  Future<Resource<UploadInsuranceResponse>> uploadInsurance(
      String userId,
      String number,
      String validTil,
      String validInsurance,
      File insurance,
      Function(int, int) onUploading);
}
