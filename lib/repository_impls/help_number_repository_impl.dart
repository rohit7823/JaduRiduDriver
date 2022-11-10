
import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/help_response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_data_help_repository.dart';
import 'package:jadu_ride_driver/data/online/help_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/domain/response/upload_data_response.dart';
import '../core/repository/help_repository.dart';

class HelpPhoneNumberRepositoryImpl extends HelpRepository{

  final Dio dio;
  late HelpApi _helpApi;
  HelpPhoneNumberRepositoryImpl (this.dio){
    dio.options = ApiClientConfiguration.mainConfiguration;
    _helpApi = HelpApi(dio);
  }

  @override
  Future<Resource<RequiredDataHelpResponse>> getHelpInittialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataHelpResponse(status: true, message: "Success", helpPhoneNumber: "9876543210"));
  }

  @override
  Future<Resource<HelpResponse>> uploadInqueryData(String userId, String userInputName, String userInputEmail, String userInputSubject, String userInputMsg) async{
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(HelpResponse(status: true, message: "Success", isUploaded: true));
    return _helpApi.helpCall(userId, userInputName,userInputEmail ,userInputSubject , userInputMsg).handleResponse<HelpResponse>();
  }

}