import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_image_response.dart';
import 'package:jadu_ride_driver/core/repository/profile_picture_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';

import '../data/online/profile_picture_api.dart';

class ProfilePictureRepositoryImpl implements ProfilePictureRepository {
  final Dio _dio;
  late ProfilePictureApi _profilePictureApi;
  ProfilePictureRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _profilePictureApi = ProfilePictureApi(_dio);
  }

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
