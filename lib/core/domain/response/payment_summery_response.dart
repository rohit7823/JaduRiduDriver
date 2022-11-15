import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../payment_summery.dart';

class  GetPaymentSummeryResponse extends BusinessObject{

  bool status;
  String message;
  List<RechargeHistory> paymentSummeryList;

  GetPaymentSummeryResponse({
  required this.status,
  required this.message,
  required this.paymentSummeryList});

  factory GetPaymentSummeryResponse.fromJson(Map<String, dynamic> json) => GetPaymentSummeryResponse(
    status: json["status"],
    message: json["message"],
    paymentSummeryList: List<RechargeHistory>.from(json["rechargeHistory"].map((x) => RechargeHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "paymentSummeryList": List<dynamic>.from(paymentSummeryList.map((x) => x.toJson())),
  };
}