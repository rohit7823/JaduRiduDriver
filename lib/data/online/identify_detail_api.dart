import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_detail_questions_response.dart';
import 'package:jadu_ride_driver/core/domain/response/identify_question_answer_response.dart';
import 'package:retrofit/http.dart';

part 'identify_detail_api.g.dart';

@RestApi()
abstract class IdentifyDetailApi {
  factory IdentifyDetailApi(Dio dio, {String? baseUrl}) = _IdentifyDetailApi;

  @GET(ApiRoutes.identifyDetailQuestions)
  Future<IdentifyDetailQuestionsResponse> questions();

  @POST("${ApiRoutes.parent}/users/{userId}/answer")
  @FormUrlEncoded()
  Future<IdentifyQuestionAnswerResponse> answer(
      @Path("userId") String userId,
      @Field("questionId") String questionId,
      @Field("optionId") String optionId);
}
