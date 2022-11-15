import 'package:flutter/cupertino.dart';

class TodayPaymentHistory {
  TodayPaymentHistory({
    required this.transationAt,
    required this.paymentMode,
    required this.amount,
    required this.colorCode,
  });

  final String transationAt;
  final String paymentMode;
  final String amount;
  final String colorCode;

  factory TodayPaymentHistory.fromJson(Map<String, dynamic> json) => TodayPaymentHistory(
    transationAt: json["transationAt"],
    paymentMode: json["paymentMode"],
    amount: json["amount"],
    colorCode:json["colorCode"],
  );

  Map<String, dynamic> toJson() => {
    "transationAt": transationAt,
    "paymentMode":paymentMode,
    "amount": amount,
    "colorCode": colorCode,
  };
}