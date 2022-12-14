

import 'dart:io';

import '../common/response.dart';
import '../domain/response/cities_response.dart';
import '../domain/response/districts_response.dart';
import '../domain/response/required_data_profile_details_response.dart';
import '../domain/response/upload_profile_details_response.dart';

abstract class ProfileDetailsRepository{

  Future<Resource<RequiredDataProfileDetailsResponse>> getProfileInittialData(String userId);

  Future<Resource<DistrictsResponse>> districts(String selectedStateId);

  Future<Resource<CitiesResponse>> cities(String selectedDistrictId);

  Future<Resource<UploadProfileDetailsResponse>> uploadProfileDetails(
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