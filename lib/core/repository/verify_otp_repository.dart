import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/otp_verification_response.dart';

abstract class VerifyOtpRepository {
  Future<Resource<OtpVerificationResponse>> verifyOtp(
      String number, String otp);
}
