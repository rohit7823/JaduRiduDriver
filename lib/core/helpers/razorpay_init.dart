import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../utills/razorpay_events.dart';


class RazorpayInit extends RazorpayEvents {
  final Razorpay _razorPay = dependency<Razorpay>();

  Function(ExternalWalletResponse) walletNotify;
  Function(PaymentFailureResponse) errorNotify;
  Function(PaymentSuccessResponse) successNotify;

  RazorpayInit(
      {required Map<String, dynamic> options,
        required this.successNotify,
        required this.errorNotify,
        required this.walletNotify}) {
    _razorPay.open(options);
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, onPaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, onPaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, onExternalWallet);
  }

  dispose() {
    _razorPay.clear();
    debugPrint("razorpayClearing");
  }

  @override
  void onExternalWallet(ExternalWalletResponse externalWalletResponse) {
    debugPrint("wallet ${externalWalletResponse.walletName}");
    walletNotify(externalWalletResponse);
  }

  @override
  void onPaymentError(PaymentFailureResponse paymentFailureResponse) {
    debugPrint("error ${paymentFailureResponse.message}");
    errorNotify(paymentFailureResponse);
  }

  @override
  void onPaymentSuccess(PaymentSuccessResponse paymentSuccessResponse) {
    debugPrint("success ${paymentSuccessResponse.orderId}");
    successNotify(paymentSuccessResponse);
  }
}
