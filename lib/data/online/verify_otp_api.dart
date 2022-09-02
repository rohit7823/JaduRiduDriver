import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/otp_verification_response.dart';

part 'verify_otp_api.g.dart';

@RestApi()
abstract class VerifyOtpApi {
  factory VerifyOtpApi(Dio dio, {String? baseUrl}) = _VerifyOtpApi;

  @GET(ApiRoutes.verifyOtp)
  Future<OtpVerificationResponse> verifyOtp(
      @Query("mobile") String number, @Query("otp") String otp);
}
