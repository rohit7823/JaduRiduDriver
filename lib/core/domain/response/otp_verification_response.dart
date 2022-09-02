import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

OtpVerificationResponse otpVerificationResponseFromJson(String str) =>
    OtpVerificationResponse.fromJson(json.decode(str));

String otpVerificationResponseToJson(OtpVerificationResponse data) =>
    json.encode(data.toJson());

class OtpVerificationResponse extends BusinessObject {
  OtpVerificationResponse(
      {required this.status,
      required this.message,
      required this.isVerified,
      required this.userId,
      required this.userStatus});

  bool status;
  String message;
  bool isVerified;
  String userId;
  String userStatus;

  factory OtpVerificationResponse.fromJson(Map<String, dynamic> json) =>
      OtpVerificationResponse(
        status: json["status"],
        message: json["message"],
        isVerified: json["isMatched"],
        userId: json["userId"],
        userStatus: json["userStatus"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isMatched": isVerified,
        "userId": userId,
        "userStatus": userStatus,
      };
}
