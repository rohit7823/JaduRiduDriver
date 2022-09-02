import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/domain/response/number_codes_response.dart';
import 'package:jadu_ride_driver/core/domain/response/send_otp_response.dart';
import 'package:jadu_ride_driver/core/repository/number_input_repository.dart';
import 'package:jadu_ride_driver/data/online/number_input_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class NumberInputRepositoryImpl implements NumberInputRepository {
  final Dio _dio;
  late final NumberInputApi _numberInputApi;
  NumberInputRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _numberInputApi = NumberInputApi(_dio);
  }

  @override
  Future<Resource<NumberCodesResponse>> getNumberCodes() async {
    return await _numberInputApi
        .numberCodes()
        .handleResponse<NumberCodesResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(
        NumberCodesResponse(status: true, message: "Success", codes: [
      MobileNumberCode(
          id: "312131", countryImage: "assets/images/india.png", code: "+91")
    ]));*/
  }

  @override
  Future<Resource<SendOtpResponse>> sendOtp(
      String number, String codeId) async {
    var trimedNumber = "";
    number.split("-").forEach((element) {
      trimedNumber += element;
    });
    return await _numberInputApi
        .sendOtp(trimedNumber)
        .handleResponse<SendOtpResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(
        SendOtpResponse(status: true, message: "Success", isSend: true));*/
  }
}
