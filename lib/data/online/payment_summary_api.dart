import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_summery_response.dart';
import 'package:retrofit/http.dart';

part 'payment_summary_api.g.dart';


@RestApi()
abstract class PaymentSummaryApi {
  factory PaymentSummaryApi(Dio dio, {String? baseUrl}) = _PaymentSummaryApi;

  @GET("${ApiRoutes.parent}/users/{userId}/paymentSummery")
  Future<GetPaymentSummeryResponse> paymentsummary(
      @Path("userId") String userInputId,
      @Query("from") String selected
      );

}