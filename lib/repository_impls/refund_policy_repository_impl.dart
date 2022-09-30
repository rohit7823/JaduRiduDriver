
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_data_refund_policy_repository.dart';

import '../core/repository/refund_policy_repository.dart';

class RefundPolicyRepositoryImpl extends RefundPolicyRepository{
  @override
  Future<Resource<RequiredDataRefundPolicyResponse>> getRefundPolicyInittialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataRefundPolicyResponse(status: true, message: "Success", refundPolicyTxt: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."));
  }

}