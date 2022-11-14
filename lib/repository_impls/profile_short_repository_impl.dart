

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/profile_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_short_detail_response.dart';
import 'package:jadu_ride_driver/core/repository/profile_repository.dart';
import 'package:jadu_ride_driver/data/online/short_profile_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/domain/profile_short_response.dart';

class ProfileShortRepositoryImpl implements ProfileRepository {
  final Dio dio;
  late final ProfileShortApi _profileShortApi;

  ProfileShortRepositoryImpl(this.dio) {
    dio.options = ApiClientConfiguration.mainConfiguration;
    _profileShortApi = ProfileShortApi(dio);
  }


  @override
  Future<Resource<ShortProfileDetailResponse>> profileRequest(String userInputId) async {
    return await _profileShortApi
        .shortdetails(userInputId)
        .handleResponse<ShortProfileDetailResponse>();

    // await Future.delayed(const Duration(seconds: 2));
    // return Success(ProfileResponse(
    //     status: true, message: "Success",
    //     driverShortProfile: DriverShortProfile(
    //         driverName: "Mukesh Janha",
    //         profileImagePath: "https://i.pravatar.cc/100")));
  }

}