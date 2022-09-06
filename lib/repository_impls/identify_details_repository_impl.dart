import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/question.dart';
import 'package:jadu_ride_driver/core/domain/question_option.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_detail_questions_response.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_question_answer_response.dart';
import 'package:jadu_ride_driver/core/repository/identify_details_repository.dart';

class IdentifyDetailsRepositoryImpl implements IdentifyDetailsRepository {
  @override
  Future<Resource<IdentifyDetailQuestionsResponse>> identifyQuestions(
      String userId) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(IdentifyDetailQuestionsResponse(
        status: true,
        message: "Success",
        questions: [
          Question(
              id: "1",
              question: "Question 1",
              isMandatory: true,
              options: [
                QuestionOption(id: "1", option: "Yes"),
                QuestionOption(id: "2", option: "No")
              ]),
          Question(
              id: "2",
              question: "Question 2",
              isMandatory: true,
              options: [
                QuestionOption(id: "1", option: "Yes"),
                QuestionOption(id: "2", option: "No")
              ]),
          Question(
              id: "3",
              question: "Question 3",
              isMandatory: false,
              options: [
                QuestionOption(id: "1", option: "Driving License"),
                QuestionOption(id: "2", option: "Aadhar"),
                QuestionOption(id: "3", option: "Others")
              ])
        ]));
  }

  @override
  Future<Resource<IdentifyQuestionAnswerResponse>> setAnswer(
      String userId, String questionId, String optionId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(IdentifyQuestionAnswerResponse(
        status: true, message: "Success", isUpdated: true));
  }
}
