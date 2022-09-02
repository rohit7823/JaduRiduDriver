import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/user_status.dart';
import 'package:jadu_ride_driver/core/domain/response/otp_verification_response.dart';
import 'package:jadu_ride_driver/core/repository/verify_otp_repository.dart';
import 'package:jadu_ride_driver/data/online/verify_otp_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class VerifyOtpRepositoryImpl implements VerifyOtpRepository {
  final Dio _dio;
  late final VerifyOtpApi _verifyOtpApi;

  VerifyOtpRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _verifyOtpApi = VerifyOtpApi(_dio);
  }

  @override
  Future<Resource<OtpVerificationResponse>> verifyOtp(
      String number, String otp) async {
    var trimmedNumber = "";
    number.split("-").forEach((element) {
      trimmedNumber += element;
    });

    return await _verifyOtpApi
        .verifyOtp(trimmedNumber, otp)
        .handleResponse<OtpVerificationResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(OtpVerificationResponse(
        status: true,
        message: "Success",
        isVerified: true,
        userId: "asdasdqasdqw",
        userStatus: UserStatus.unRegistered.value));*/
  }
}
