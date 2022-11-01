import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/cities_response.dart';
import 'package:jadu_ride_driver/core/domain/response/districts_response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_welcome_jadu_ride_response.dart';
import 'package:jadu_ride_driver/core/domain/response/user_primary_registration_response.dart';
import 'package:jadu_ride_driver/core/repository/welcome_jadu_ride_repository.dart';
import 'package:jadu_ride_driver/data/online/welcome_jadu_ride_api.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class WelcomeJaduRideRepositoryImpl implements WelcomeJaduRideRepository {
  final Dio _dio;
  late final WelcomeJaduRideApi _welcomeJaduRideApi;

  WelcomeJaduRideRepositoryImpl(this._dio) {
    _welcomeJaduRideApi = WelcomeJaduRideApi(_dio);
  }

  @override
  Future<Resource<CitiesResponse>> cities(String selectedDistrictId) async {
    return _welcomeJaduRideApi
        .cities(selectedDistrictId)
        .handleResponse<CitiesResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(CitiesResponse(
        status: true,
        message: "Success",
        cities: List.generate(
            5,
            (index) =>
                Package(id: "${index + 1}", name: "City ${index + 1}"))));*/
  }

  @override
  Future<Resource<DistrictsResponse>> districts(String selectedStateId) async {
    return _welcomeJaduRideApi
        .districts(selectedStateId)
        .handleResponse<DistrictsResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(DistrictsResponse(
        status: true,
        message: "Success",
        districts: List.generate(
            5,
            (index) =>
                Package(id: "${index + 1}", name: "District ${index + 1}"))));*/
  }

  @override
  Future<Resource<RequiredDataWelcomeJaduRideResponse>> getInitialData(
      String userId) async {
    return _welcomeJaduRideApi
        .initialData(userId)
        .handleResponse<RequiredDataWelcomeJaduRideResponse>();
    /*await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataWelcomeJaduRideResponse(
        status: true,
        message: "Success",
        mobileNumber: "7003844205",
        states: List.generate(2,
            (index) => Package(id: "${index + 1}", name: "State ${index + 1}")),
        numberCodes: [
          MobileNumberCode(
              id: "312131",
              countryImage:
                  ImageAssets.flagIndia */ /*"assets/images/flag_india.png"*/ /*,
              code: "+91")
        ]));*/
  }

  @override
  Future<Resource<UserPrimaryRegistrationResponse>> sendUserData(
      String userId,
      String userName,
      String userEmail,
      String userMobileNumber,
      String stateId,
      String districtId,
      String cityId,
      String referralCode,
      bool isTermsSelected) async {
    return await _welcomeJaduRideApi
        .driverDetails(userId, userName, userEmail, referralCode, stateId,
            districtId, cityId)
        .handleResponse<UserPrimaryRegistrationResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(UserPrimaryRegistrationResponse(
        status: true, message: "Success", isSaved: true));*/
  }
}
