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
}
