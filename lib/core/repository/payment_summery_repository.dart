import '../common/response.dart';
import '../domain/response/payment_summery_response.dart';
abstract class PaymentSummeryRepository {
  Future<Resource<GetPaymentSummeryResponse>> getPaymentSummeryResponse(String userInputId, String finalCurrentDate);
}