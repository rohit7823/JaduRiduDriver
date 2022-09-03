import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_chasis_number_response.dart';
import 'package:jadu_ride_driver/core/repository/chasis_number_repository.dart';

class ChasisNumberRepositoryImpl implements ChasisNumberRepository {
  @override
  Future<Resource<UploadChasisNumberResponse>> uploadChasisNumber(String userId,
      String number, File chasisNumber, Function(bool, int) onUploading) async {
    var size = await chasisNumber.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadChasisNumberResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
