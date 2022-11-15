import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/todays_payment_response.dart';
import 'package:retrofit/http.dart';

part 'todays_payment_api.g.dart';

@RestApi()
abstract class TodaysPaymentApi {
  factory TodaysPaymentApi(Dio dio, {String? baseUrl}) = _TodaysPaymentApi;

  @GET("${ApiRoutes.parent}/users/{userId}/todayPayment")
  Future<GetTodaysPaymentResponse> paymenttoday(@Path("userId") String userId);

}