import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_driver_license_response.dart';

abstract class DriverLicenseRepository {

  Future<MasterResponse> setData(String userId);

  Future<Resource<UploadDriverLicenseResponse>> uploadLicense(
      String userId,
      String number,
      File license,
      String expiryDate,
      Function(int, int) onUploading);
}
