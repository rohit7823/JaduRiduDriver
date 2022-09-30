
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/cities_response.dart';

import 'package:jadu_ride_driver/core/domain/response/districts_response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_data_profile_details_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_profile_details_response.dart';

import '../core/domain/mobile_number_code.dart';
import '../core/domain/package.dart';
import '../core/repository/profile_details_repository.dart';
import '../presentation/ui/image_assets.dart';

class ProfileDetailsRepositoryImpl implements ProfileDetailsRepository{

  @override
  Future<Resource<CitiesResponse>> cities(String selectedDistrictId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(CitiesResponse(
        status: true,
        message: "Success",
        cities: List.generate(
            5,
                (index) =>
                Package(id: "${index + 1}", name: "City ${index + 1}"))));
  }

  @override
  Future<Resource<DistrictsResponse>> districts(String selectedStateId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(DistrictsResponse(
        status: true,
        message: "Success",
        districts: List.generate(
            5,
                (index) =>
                Package(id: "${index + 1}", name: "District ${index + 1}"))));
  }

  @override
  Future<Resource<RequiredDataProfileDetailsResponse>> getProfileInittialData(String userId) async{
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataProfileDetailsResponse(status: true, message: "Success", name: "Ramesh Janha",
        numberCodes: [
          MobileNumberCode(
              id: "312131",
              countryImage: ImageAssets.flagIndia/*"assets/images/flag_india.png"*/,
              code: "+91")
        ],
        dob: "25th june 1990", email: "abc@gmail.com", gender: "male", mobileNumber: "1234567890", states: List.generate(2,
                (index) => Package(id: "${index + 1}", name: "State ${index + 1}"))));
  }

  @override
  Future<Resource<UploadProfileDetailsResponse>> uploadProfileDetails(String userId, String userName, String userEmail, String userMobileNumber, String stateId, String districtId, String cityId, String gender, String dob) async
  {
    await Future.delayed(const Duration(seconds: 2));
    return Success(UploadProfileDetailsResponse(status: true, message: "Success", isSaved: true));
  }

}