import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_driver_license_response.dart';
import 'package:jadu_ride_driver/core/repository/driver_license_repository.dart';

class DriverLicenseRepositoryImpl implements DriverLicenseRepository {
  @override
  Future<Resource<UploadDriverLicenseResponse>> uploadLicense(String userId,
      String number, File license, Function(bool, int) onUploading) async {
    var size = await license.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadDriverLicenseResponse(
        status: true, message: "Success", isUploaded: false));
  }
}
