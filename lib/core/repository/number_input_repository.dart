import 'package:jadu_ride_driver/core/common/response.dart';

import '../domain/response/number_codes_response.dart';
import '../domain/response/send_otp_response.dart';

abstract class NumberInputRepository {
  Future<Resource<NumberCodesResponse>> getNumberCodes();
  Future<Resource<SendOtpResponse>> sendOtp(String number, String codeId);
}
