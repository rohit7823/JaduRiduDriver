import 'dart:convert';

import 'business_object.dart';

FcmTokenResponse fcmTokenResponseFromJson(String str) =>
    FcmTokenResponse.fromJson(json.decode(str));

String fcmTokenResponseToJson(FcmTokenResponse data) =>
    json.encode(data.toJson());

class FcmTokenResponse extends BusinessObject {
  FcmTokenResponse(
      {required this.status,
      required this.message,
      required this.tokenUpdated});

  bool status;
  String message;
  bool tokenUpdated;

  factory FcmTokenResponse.fromJson(Map<String, dynamic> json) =>
      FcmTokenResponse(
        status: json["status"],
        message: json["message"],
        tokenUpdated: json["isSet"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isSet": tokenUpdated,
      };
}
