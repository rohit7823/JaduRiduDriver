import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/question.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

IdentifyDetailQuestionsResponse identifyDetailQuestionsResponseFromJson(String str) => IdentifyDetailQuestionsResponse.fromJson(json.decode(str));

String identifyDetailQuestionsResponseToJson(IdentifyDetailQuestionsResponse data) => json.encode(data.toJson());

class IdentifyDetailQuestionsResponse extends BusinessObject{
  IdentifyDetailQuestionsResponse(
      {required this.status, required this.message, required this.questions});

  bool status;
  String message;
  List<Question> questions;

  factory IdentifyDetailQuestionsResponse.fromJson(Map<String, dynamic> json) => IdentifyDetailQuestionsResponse(
    status: json["status"],
    message: json["message"],
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
  };
}

