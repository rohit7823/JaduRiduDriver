import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_image_response.dart';
import 'package:jadu_ride_driver/core/repository/profile_picture_repository.dart';
import 'package:jadu_ride_driver/data/online/prefill_details_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/profile_picture_api.dart';

class ProfilePictureRepositoryImpl implements ProfilePictureRepository {
  final Dio _dio;
  late ProfilePictureApi _profilePictureApi;
  late PrefillDetailsApi _prefillDetailsApi;

  ProfilePictureRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _profilePictureApi = ProfilePictureApi(_dio);
    _prefillDetailsApi = PrefillDetailsApi(_dio);
  }

  @override
  Future<Resource<UploadImageResponse>> uploadImage(
      String userId, File image, Function(int, int) onUploading) async {
    return await _profilePictureApi
        .profilePicture(userId, image, onUploading)
        .handleResponse<UploadImageResponse>();

    /*var size = await image.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);

    return Success(UploadImageResponse(
        status: true, message: "Success", isUploaded: true));*/
  }

  @override
  Future<MasterResponse> setImage(String userId) {
    return _prefillDetailsApi.prefillDetails(
        userId, DetailsStepKey.profilePicture.key);
  }
}
