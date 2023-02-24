import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/add_all_details_initial_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/reset_all_details_response.dart';
import 'package:jadu_ride_driver/core/repository/add_all_details_repository.dart';
import 'package:jadu_ride_driver/data/online/add_all_details_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class AddAllDetailsRepositoryImpl implements AddAllDetailsRepository {
  final Dio _dio;
  late final AddAllDetailsApi _addAllDetailsApi;
  AddAllDetailsRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _addAllDetailsApi = AddAllDetailsApi(_dio);
  }

  @override
  Future<Resource<AddAllDetailsInitialDataResponse>> initialData(
      String userId, String identifier, List<String> keys) async {

    var keysQuery = "";
    for (var element in keys) {
      if(element != keys.last) {
        keysQuery+="$element+";
      } else {
        keysQuery+=element;
      }
    }
    debugPrint("keysQuery $keysQuery");
    return await _addAllDetailsApi
        .initialData(userId, identifier, keysQuery)
        .handleResponse<AddAllDetailsInitialDataResponse>();

    /*await Future.delayed(const Duration(seconds: 3));

    return Success(AddAllDetailsInitialDataResponse(
        status: true,
        message: "Success",
        requiredSteps: List.generate(
            10,
            (index) => DetailStep(
                id: "ID${index + 1}",
                key: _mapDetailsKeys(index),
                isComplete: index >= 0 && index <= 7
                    ? true
                    : false)), //(index + 1).isEven ? true : false)),
        optionalSteps: List.generate(
            1,
            (index) => DetailStep(
                id: "ID${index + 1}",
                key: DetailsStepKey.paymentDetails.key,
                isComplete: false))));*/
  }

  String _mapDetailsKeys(int index) {
    switch (index) {
      case 0:
        return DetailsStepKey.profilePicture.key;
      case 1:
        return DetailsStepKey.driverLicense.key;
      case 2:
        return DetailsStepKey.aadharCard.key;
      case 3:
        return DetailsStepKey.vehicleInsurance.key;
      case 4:
        return DetailsStepKey.registrationCertificate.key;
      case 5:
        return DetailsStepKey.panCard.key;
      case 6:
        return DetailsStepKey.vehiclePermit.key;
      case 7:
        return DetailsStepKey.vehicleAudit.key;
      case 8:
        return DetailsStepKey.vehiclePollution.key;
      case 9:
        return DetailsStepKey.identifyDetails.key;
      default:
        return "";
    }
  }

  @override
  Future<Resource<ResetAllDetailsResponse>> resetDetails(String userId) async {
    return await _addAllDetailsApi
        .resetAll(userId)
        .handleResponse<ResetAllDetailsResponse>();

    /*await Future.delayed(const Duration(seconds: 3));

    return Success(ResetAllDetailsResponse(
        status: true, message: "Success", isAllCleared: true));*/
  }
}
