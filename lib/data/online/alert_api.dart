import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/expired_document_alert_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'alert_api.g.dart';

@RestApi()
abstract class AlertApi {

  factory AlertApi(Dio dio, {String? baseUrl}) = _AlertApi;

  @GET("${ApiRoutes.parent}/users/{userId}/document/reupload")
  Future<ExpiredDocumentAlertResponse> giveAlert(
      @Path("userId") String userId);

}