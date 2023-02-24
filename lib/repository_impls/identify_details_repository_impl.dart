import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_detail_questions_response.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_question_answer_response.dart';
import 'package:jadu_ride_driver/core/repository/identify_details_repository.dart';
import 'package:jadu_ride_driver/data/online/identify_detail_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/prefill_details_api.dart';

class IdentifyDetailsRepositoryImpl implements IdentifyDetailsRepository {
  final Dio _dio;
  late final IdentifyDetailApi _identifyDetailsApi;
  late final PrefillDetailsApi _prefillDetailsApi;

  IdentifyDetailsRepositoryImpl(this._dio) {
    debugPrint(
        "baseUrl in number input ${ApiClientConfiguration.mainConfiguration.baseUrl}");
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _identifyDetailsApi = IdentifyDetailApi(_dio);
  }

  @override
  Future<Resource<IdentifyDetailQuestionsResponse>> identifyQuestions(
      String userId) async {
    return await _identifyDetailsApi
        .questions()
        .handleResponse<IdentifyDetailQuestionsResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

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
        ]));*/
  }

  @override
  Future<Resource<IdentifyQuestionAnswerResponse>> setAnswer(
      String userId, String questionId, String optionId) async {
    return await _identifyDetailsApi
        .answer(userId, questionId, optionId)
        .handleResponse<IdentifyQuestionAnswerResponse>();

    /*await Future.delayed(const Duration(seconds: 2));
    return Success(IdentifyQuestionAnswerResponse(
        status: true, message: "Success", isUpdated: true));*/
  }
}
