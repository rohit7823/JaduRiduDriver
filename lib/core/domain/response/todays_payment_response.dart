
import '../../../presentation/stores/todays_payment_view_model.dart';
import '../todays_list_response.dart';

class GetTodaysPaymentResponse{

  bool status;
  String message;
  List<TodaysPayment> todaysPayment;

  GetTodaysPaymentResponse({required this.status, required this.message, required this.todaysPayment});
}

