import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:retrofit/http.dart';

import '../../core/domain/response/app_language_update_response.dart';

part 'change_language_api.g.dart';

@RestApi()
abstract class ChangeLanguageApi {
  factory ChangeLanguageApi(Dio dio, {String? baseUrl}) = _ChangeLanguageApi;

  @POST("${ApiRoutes.parent}/users/{userId}/language/current")
  @FormUrlEncoded()
  Future<AppLanguageUpdateResponse> changeLang(
      @Field("langCode") String langCode, @Path("userId") String userId);
}
