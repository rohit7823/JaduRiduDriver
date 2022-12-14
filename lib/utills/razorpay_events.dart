import 'package:razorpay_flutter/razorpay_flutter.dart';

abstract class RazorpayEvents {
  void onPaymentSuccess(PaymentSuccessResponse paymentSuccessResponse);
  void onPaymentError(PaymentFailureResponse paymentFailureResponse);
  void onExternalWallet(ExternalWalletResponse externalWalletResponse);
}
