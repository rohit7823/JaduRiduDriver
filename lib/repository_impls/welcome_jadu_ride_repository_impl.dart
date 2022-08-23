import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/cities_response.dart';
import 'package:jadu_ride_driver/core/domain/response/districts_response.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_welcome_jadu_ride_response.dart';
import 'package:jadu_ride_driver/core/repository/welcome_jadu_ride_repository.dart';

class WelcomeJaduRideRepositoryImpl implements WelcomeJaduRideRepository {
  @override
  Future<Resource<CitiesResponse>> cities(String selectedDistrictId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(CitiesResponse(
        status: true,
        message: "Success",
        cities: List.generate(5, (index) => Package(
            id: "${index+1}",
            name: "City ${index+1}")
        )
      )
    );
  }

  @override
  Future<Resource<DistrictsResponse>> districts(String selectedStateId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(DistrictsResponse(
        status: true,
        message: "Success",
        districts: List.generate(5, (index) => Package(id: "${index+1}", name: "District ${index+1}"))
      )
    );
  }

  @override
  Future<Resource<RequiredDataWelcomeJaduRideResponse>> getInitialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataWelcomeJaduRideResponse(
        status: true,
        message: "Success",
        mobileNumber: "7003844205",
        states: List.generate(2, (index) => Package(id: "${index+1}", name: "State ${index+1}")),
        numberCodes: [MobileNumberCode(
            id: "312131", countryImage: "assets/images/india.png", code: "+91")])
    );
  }

}