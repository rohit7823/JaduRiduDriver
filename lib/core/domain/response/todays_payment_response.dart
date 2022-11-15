
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../../../presentation/stores/todays_payment_view_model.dart';
import '../todays_list_response.dart';

class GetTodaysPaymentResponse extends BusinessObject{

  bool status;
  String message;
  List<TodayPaymentHistory> todaysPayment;

  GetTodaysPaymentResponse({
    required this.status,
    required this.message,
    required this.todaysPayment});

  factory GetTodaysPaymentResponse.fromJson(Map<String, dynamic> json) => GetTodaysPaymentResponse(
    status: json["status"],
    message: json["message"],
    todaysPayment: List<TodayPaymentHistory>.from(json["todayPaymentHistory"].map((x) => TodayPaymentHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "todayPaymentHistory": List<dynamic>.from(todaysPayment.map((x) => x.toJson())),
  };
}

