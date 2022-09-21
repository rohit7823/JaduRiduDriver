
import '../common/response.dart';
import '../domain/response/todays_payment_response.dart';
abstract class TodaysPaymentRepository{
  Future<Resource<GetTodaysPaymentResponse>> getTodaysPaymentResponse(String userInputId);
}