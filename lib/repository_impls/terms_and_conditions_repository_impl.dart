import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_dataterms_and_conditions_response.dart';
import 'package:jadu_ride_driver/data/online/policy_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/repository/terms_and_conditions_repository.dart';

class TermsAndContionsRepositoryImpl extends TermsAndConditionsRepository{

  final Dio _dio;
  late final PolicyApi _policyApi;
  TermsAndContionsRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _policyApi = PolicyApi(_dio);
  }

  @override
  Future<Resource<RequiredDataTermsAndConditionsResponse>> getTermsAndConditionsInittialData(String userId) async {

    return _policyApi.terms().handleResponse<RequiredDataTermsAndConditionsResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataTermsAndConditionsResponse(status: true, message: "Success",
        termsConditionsTxt: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."));*/
  }

}