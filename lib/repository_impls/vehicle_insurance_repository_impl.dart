import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_insurance_response.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_insurance_repository.dart';

class VehicleInsuranceRepositoryImpl implements VehicleInsuranceRepository {
  @override
  Future<Resource<UploadInsuranceResponse>> uploadInsurance(
      String userId,
      String number,
      String validTil,
      String validInsurance,
      File insurance,
      Function(bool, int) onUploading) async {
    var size = await insurance.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);

    return Success(UploadInsuranceResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
