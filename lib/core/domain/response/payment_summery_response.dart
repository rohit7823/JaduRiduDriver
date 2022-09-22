import '../payment_summery.dart';

class GetPaymentSummeryResponse {

  bool status;
  String message;
  List<PaymentSummery> paymentSummeryList;

  GetPaymentSummeryResponse({required this.status,
  required this.message,
  required this.paymentSummeryList});
}