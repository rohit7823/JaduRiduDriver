import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

IdentifyQuestionAnswerResponse identifyQuestionAnswerResponseFromJson(String str) => IdentifyQuestionAnswerResponse.fromJson(json.decode(str));

String identifyQuestionAnswerResponseToJson(IdentifyQuestionAnswerResponse data) => json.encode(data.toJson());

class IdentifyQuestionAnswerResponse extends BusinessObject {
  IdentifyQuestionAnswerResponse(
      {required this.status, required this.message, required this.isUpdated});

  bool status;
  String message;
  bool isUpdated;


  factory IdentifyQuestionAnswerResponse.fromJson(Map<String, dynamic> json) => IdentifyQuestionAnswerResponse(
    status: json["status"],
    message: json["message"],
    isUpdated: json["isUpdated"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isUpdated": isUpdated,
  };
}
