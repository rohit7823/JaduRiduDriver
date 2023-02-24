
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/cities_response.dart';

import 'package:jadu_ride_driver/core/domain/response/districts_response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_data_profile_details_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_profile_details_response.dart';
import 'package:jadu_ride_driver/data/online/manage_profile_api.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/domain/mobile_number_code.dart';
import '../core/domain/package.dart';
import '../core/repository/profile_details_repository.dart';
import '../presentation/ui/image_assets.dart';

class ProfileDetailsRepositoryImpl implements ProfileDetailsRepository{
  final Dio _dio;
  late final ManageProfileApi _manageProfileApi;

  ProfileDetailsRepositoryImpl(this._dio){
    _manageProfileApi = ManageProfileApi(_dio);
  }

  @override
  Future<Resource<CitiesResponse>> cities(String selectedDistrictId, String userId) async {
    return _manageProfileApi
        .cities(selectedDistrictId, userId)
        .handleResponse<CitiesResponse>();
  }

  @override
  Future<Resource<DistrictsResponse>> districts(String selectedStateId, String userId) async {
    return _manageProfileApi
        .districts(selectedStateId, userId)
        .handleResponse<DistrictsResponse>();
  }

  @override
  Future<Resource<FetchProfileDetailsResponse>> getProfileInittialData(String userId) async{
   return _manageProfileApi
       .getProfile(userId)
       .handleResponse<FetchProfileDetailsResponse>();

  }

  @override
  Future<Resource<UpdateProfileDetailsResponse>> uploadProfileDetails(
      String userId,
      String userName,
      String userEmail,
      String userMobileNumber,
      String stateId,
      String districtId,
      String cityId,
      String gender,
      String dob, File? profileImage)async {

    return _manageProfileApi
        .uploadProfile(userId,  userName, userEmail, userMobileNumber, stateId, districtId, cityId, gender, dob, profileImage)
        .handleResponse<UpdateProfileDetailsResponse>();
  }



}