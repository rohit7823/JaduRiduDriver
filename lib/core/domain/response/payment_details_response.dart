import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

PaymentDetailsResponse paymentDetailsResponseFromJson(String str) => PaymentDetailsResponse.fromJson(json.decode(str));

String paymentDetailsResponseToJson(PaymentDetailsResponse data) => json.encode(data.toJson());

class PaymentDetailsResponse extends BusinessObject{
  PaymentDetailsResponse(
      {required this.status, required this.message, required this.isSubmitted});

  bool status;
  String message;
  bool isSubmitted;

  factory PaymentDetailsResponse.fromJson(Map<String, dynamic> json) => PaymentDetailsResponse(
    status: json["status"],
    message: json["message"],
    isSubmitted: json["isSubmitted"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isSubmitted": isSubmitted,
  };
}
