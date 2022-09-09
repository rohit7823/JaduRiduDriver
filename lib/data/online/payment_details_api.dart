import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_details_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upis_response.dart';
import 'package:retrofit/http.dart';

part 'payment_details_api.g.dart';

@RestApi()
abstract class PaymentDetailsApi {
  factory PaymentDetailsApi(Dio dio, {String? baseUrl}) = _PaymentDetailsApi;

  @GET(ApiRoutes.upiHandles)
  Future<UpisResponse> upiHandles();

  @POST("${ApiRoutes.parent}/users/{userId}/document/onlinePaymentDetails")
  @MultiPart()
  Future<PaymentDetailsResponse> paymentDetails(
      @Path("userId") String userId,
      @Part(name: "upiId") String upiId,
      @Part(name: "document_image") File documentImage,
      Function(int, int) uploading
  );
}