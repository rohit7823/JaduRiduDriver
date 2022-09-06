class PaymentDetailsResponse {
  bool status;
  String message;
  bool isSubmitted;

  PaymentDetailsResponse(
      {required this.status, required this.message, required this.isSubmitted});
}
