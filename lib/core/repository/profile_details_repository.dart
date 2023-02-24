

import 'dart:io';

import '../common/response.dart';
import '../domain/response/cities_response.dart';
import '../domain/response/districts_response.dart';
import '../domain/response/required_data_profile_details_response.dart';
import '../domain/response/upload_profile_details_response.dart';

abstract class ProfileDetailsRepository{

  Future<Resource<FetchProfileDetailsResponse>> getProfileInittialData(String userId);

  Future<Resource<DistrictsResponse>> districts(String selectedStateId, String userId);

  Future<Resource<CitiesResponse>> cities(String selectedDistrictId, String userId);

  Future<Resource<UpdateProfileDetailsResponse>> uploadProfileDetails(
      String userId,
      String userName,
      String userEmail,
      String userMobileNumber,
      String stateId,
      String districtId,
      String cityId,
      String gender,
      String dob,
      File? profileImage,
      );
}