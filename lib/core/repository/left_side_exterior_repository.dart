import 'dart:io';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_exterior_response.dart';

abstract class LeftSideExteriorRepository {
  Future<Resource<UploadExteriorResponse>> uploadLeftSideExterior(
      String userId, File leftSideExterior, Function(int, int) uploading);
}
