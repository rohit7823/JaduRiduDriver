import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_image_response.dart';

abstract class ProfilePictureRepository {

  Future<MasterResponse> setImage(String userId);

  Future<Resource<UploadImageResponse>> uploadImage(
      String userId, File dp, Function(int, int) onUploading);
}
