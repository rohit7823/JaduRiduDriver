import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_exterior_response.dart';

abstract class RightSideExteriorRepository {
  Future<Resource<UploadExteriorResponse>> uploadRightExterior(
      String userId, File rightSideExterior, Function(bool, int) uploading);
}
