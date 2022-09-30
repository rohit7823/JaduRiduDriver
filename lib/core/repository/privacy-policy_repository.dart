import '../common/response.dart';
import '../domain/response/reqired_data_privacy_policy_response.dart';

abstract class PrivacyPolicyRepository{
  Future<Resource<RequiredDataPrivacyPolicyResponse>> getPrivacyPolicyInittialData(String userId);
}