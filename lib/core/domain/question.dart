import 'package:jadu_ride_driver/core/domain/question_option.dart';

class Question {
  String id;
  String question;
  bool isMandatory;
  List<QuestionOption> options;

  Question(
      {required this.id,
      required this.question,
      required this.isMandatory,
      required this.options});


  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json["id"],
    isMandatory: json["isMandatory"],
    question: json["question"],
    options: List<QuestionOption>.from(json["options"].map((x) => QuestionOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isMandatory": isMandatory,
    "question": question,
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
  };
}
