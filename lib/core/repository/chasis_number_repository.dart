import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_chasis_number_response.dart';

abstract class ChasisNumberRepository {
  Future<Resource<UploadChasisNumberResponse>> uploadChasisNumber(String userId,
      String number, File chasisNumber, Function(bool, int) onUploading);
}
