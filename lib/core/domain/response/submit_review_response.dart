import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

SubmitReviewResponse submitReviewResponseFromJson(String str) =>
    SubmitReviewResponse.fromJson(json.decode(str));

String submitReviewResponseToJson(SubmitReviewResponse data) =>
    json.encode(data.toJson());

class SubmitReviewResponse extends BusinessObject{
  SubmitReviewResponse(
      {required this.status, required this.message, required this.isSubmitted});

  bool status;
  String message;
  bool isSubmitted;

  factory SubmitReviewResponse.fromJson(Map<String, dynamic> json) =>
      SubmitReviewResponse(
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
