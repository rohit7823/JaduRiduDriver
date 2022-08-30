import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_aadhar_response.dart';

abstract class AadharNumberRepository {
  Future<Resource<UploadAadharResponse>> uploadAadhar(String userId,
      String number, File aadhar, Function(bool, int) onUploading);
}
