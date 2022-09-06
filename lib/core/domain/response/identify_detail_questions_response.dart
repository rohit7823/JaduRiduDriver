import 'package:jadu_ride_driver/core/domain/question.dart';

class IdentifyDetailQuestionsResponse {
  bool status;
  String message;
  List<Question> questions;

  IdentifyDetailQuestionsResponse(
      {required this.status, required this.message, required this.questions});
}
