import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_aadhar_response.dart';
import 'package:jadu_ride_driver/core/repository/aadhar_number_repository.dart';

class AadharNumberRepositoryImpl implements AadharNumberRepository {
  @override
  Future<Resource<UploadAadharResponse>> uploadAadhar(String userId,
      String number, File aadhar, Function(bool, int) onUploading) async {
    var size = await aadhar.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 2));
    onUploading(false, 0);
    return Success(UploadAadharResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
