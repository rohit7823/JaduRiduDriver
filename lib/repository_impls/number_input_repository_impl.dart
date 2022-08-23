import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/domain/response/number_codes_response.dart';
import 'package:jadu_ride_driver/core/domain/response/send_otp_response.dart';
import 'package:jadu_ride_driver/core/repository/number_input_repository.dart';

class NumberInputRepositoryImpl implements NumberInputRepository {
  @override
  Future<Resource<NumberCodesResponse>> getNumberCodes() async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(
        NumberCodesResponse(status: true, message: "Success", codes: [
      MobileNumberCode(
          id: "312131", countryImage: "assets/images/india.png", code: "+91")
    ]));
  }

  @override
  Future<Resource<SendOtpResponse>> sendOtp(
      String number, String codeId) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(
        SendOtpResponse(status: true, message: "Success", isSend: true));
  }
}
