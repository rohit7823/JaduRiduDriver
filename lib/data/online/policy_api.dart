import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/required_data_refund_policy_repository.dart';
import 'package:jadu_ride_driver/core/domain/response/required_dataterms_and_conditions_response.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/reqired_data_privacy_policy_response.dart';

part 'policy_api.g.dart';

@RestApi()
abstract class PolicyApi {
  factory PolicyApi(Dio dio, {String baseUrl}) = _PolicyApi;


  @GET("${ApiRoutes.parent}/users/documentation/privacyPolicy")
  Future<RequiredDataPrivacyPolicyResponse> api();

  
  @GET("${ApiRoutes.parent}/users/documentation/refundPolicy")
  Future<RequiredDataRefundPolicyResponse> refundPolicy();

  @GET("${ApiRoutes.parent}/users/documentation/termsAndCondition")
  Future<RequiredDataTermsAndConditionsResponse> terms();
}