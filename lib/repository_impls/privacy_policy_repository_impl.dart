import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/reqired_data_privacy_policy_response.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/repository/privacy-policy_repository.dart';
import '../data/online/policy_api.dart';
import '../utills/api_client_configuration.dart';

class PrivacyPolicyRepositoryImpl extends PrivacyPolicyRepository {
  final Dio _dio;
  late final PolicyApi _policyApi;

  PrivacyPolicyRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _policyApi = PolicyApi(_dio);
  }

  @override
  Future<Resource<RequiredDataPrivacyPolicyResponse>>
      getPrivacyPolicyInittialData(String userId) async {
    return _policyApi.api().handleResponse<RequiredDataPrivacyPolicyResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataPrivacyPolicyResponse(status: true, message: "Success", privacyPolicyTxt: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."));*/
  }
}
