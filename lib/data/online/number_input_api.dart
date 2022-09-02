import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/send_otp_response.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/number_codes_response.dart';

part 'number_input_api.g.dart';

@RestApi()
abstract class NumberInputApi {
  factory NumberInputApi(Dio dio, {String baseUrl}) = _NumberInputApi;

  @GET(ApiRoutes.codes)
  Future<NumberCodesResponse> numberCodes();

  @GET(ApiRoutes.sendOtp)
  Future<SendOtpResponse> sendOtp(@Query("mobile") String number);
}
