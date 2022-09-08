import 'dart:convert';

import 'business_object.dart';

ResetAllDetailsResponse postResetAllDetailsResponseFromJson(String str) => ResetAllDetailsResponse.fromJson(json.decode(str));

String postResetAllDetailsResponseToJson(ResetAllDetailsResponse data) => json.encode(data.toJson());

class ResetAllDetailsResponse extends BusinessObject{
  bool status;
  String message;
  bool isAllCleared;

  ResetAllDetailsResponse(
      {required this.status,
        required this.message,
        required this.isAllCleared});

  factory ResetAllDetailsResponse.fromJson(Map<String, dynamic> json) => ResetAllDetailsResponse(
    status: json["status"],
    message: json["message"],
    isAllCleared: json["isReset"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isReset": isAllCleared,
  };
}
