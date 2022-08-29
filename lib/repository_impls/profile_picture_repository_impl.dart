import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_image_response.dart';
import 'package:jadu_ride_driver/core/repository/profile_picture_repository.dart';

class ProfilePictureRepositoryImpl implements ProfilePictureRepository {
  @override
  Future<Resource<UploadImageResponse>> uploadImage(
      String userId, File image, Function(bool, int) onUploading) async {
    var size = await image.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);

    return Success(UploadImageResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
