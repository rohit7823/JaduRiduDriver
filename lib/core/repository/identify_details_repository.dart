import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_detail_questions_response.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_question_answer_response.dart';

abstract class IdentifyDetailsRepository {
  Future<Resource<IdentifyDetailQuestionsResponse>> identifyQuestions(
      String userId);

  Future<Resource<IdentifyQuestionAnswerResponse>> setAnswer(
      String userId, String questionId, String optionId);
}
