import '../common/response.dart';
import '../domain/response/required_data_refund_policy_repository.dart';
abstract class RefundPolicyRepository {
  Future<Resource<RequiredDataRefundPolicyResponse>> getRefundPolicyInittialData(String userId);
}