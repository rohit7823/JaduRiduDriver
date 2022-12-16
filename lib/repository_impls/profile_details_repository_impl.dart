
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
  Future<Resource<CitiesResponse>> cities(String selectedDistrictId) async {
    return _manageProfileApi
        .cities(selectedDistrictId)
        .handleResponse<CitiesResponse>();
  }

  @override
  Future<Resource<DistrictsResponse>> districts(String selectedStateId) async {
    return _manageProfileApi
        .districts(selectedStateId)
        .handleResponse<DistrictsResponse>();
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(DistrictsResponse(
    //     status: true,
    //     message: "Success",
    //     districts: List.generate(
    //         5,
    //             (index) =>
    //             Package(id: "${index + 1}", name: "District ${index + 1}"))));
  }

  @override
  Future<Resource<RequiredDataProfileDetailsResponse>> getProfileInittialData(String userId) async{
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataProfileDetailsResponse(status: true, message: "Success",
        name: "Ramesh Janha",
        email: "abc@gmail.com",
        numberCodes: [
          MobileNumberCode(
              id: "312131",
              countryImage: "assets/images/india.png",
              code: "+91")
        ],
      mobileNumber: "1234567890",
      states: List.generate(2, (index) => Package(id: "${index + 1}", name: "State ${index + 1}")),
        dob: "25th june 1990",
        gender: "male", profileImage: "assets/images/flag_india.png"
    ));
  }

  @override
  Future<Resource<UploadProfileDetailsResponse>> uploadProfileDetails(String userId, String userName, String userEmail, String userMobileNumber, String stateId, String districtId, String cityId, String gender, String dob, File? profileImage)async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(UploadProfileDetailsResponse(status: true, message: "Success", isSaved: true));
  }



}