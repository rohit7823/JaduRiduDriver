import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/otp_verification_response.dart';
import 'package:jadu_ride_driver/core/repository/verify_otp_repository.dart';

class VerifyOtpRepositoryImpl implements VerifyOtpRepository {
  @override
  Future<Resource<OtpVerificationResponse>> verifyOtp(
      String number, String otp) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(OtpVerificationResponse(
        status: true,
        message: "Success",
        isVerified: true,
        userId: "asdasdqasdqw"));
  }
}
