import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../payment_summery.dart';

class  GetPaymentSummeryResponse extends BusinessObject{

  GetPaymentSummeryResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final Data data;

  factory GetPaymentSummeryResponse.fromJson(Map<String, dynamic> json) => GetPaymentSummeryResponse(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}



