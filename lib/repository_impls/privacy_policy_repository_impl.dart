
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/reqired_data_privacy_policy_response.dart';

import '../core/repository/privacy-policy_repository.dart';

class PrivacyPolicyRepositoryImpl extends PrivacyPolicyRepository{
  @override
  Future<Resource<RequiredDataPrivacyPolicyResponse>> getPrivacyPolicyInittialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataPrivacyPolicyResponse(status: true, message: "Success", privacyPolicyTxt: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."));

  }

}