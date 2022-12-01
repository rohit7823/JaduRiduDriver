import '../common/response.dart';
import '../domain/response/upload_incentive_response.dart';

abstract class IncentiveRepository{
  Future<Resource<CollectCouponResponse>> uploadIncentiveResponse(String userInputId);
}