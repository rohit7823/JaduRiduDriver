import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_exterior_response.dart';
import 'package:jadu_ride_driver/core/repository/right_side_exterior_repository.dart';

class RightSideExteriorRepositoryImpl implements RightSideExteriorRepository {
  @override
  Future<Resource<UploadExteriorResponse>> uploadRightExterior(String userId,
      File rightSideExterior, Function(bool p1, int p2) uploading) async {
    var size = await rightSideExterior.length();
    uploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    uploading(false, 0);
    return Success(UploadExteriorResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
