import 'dart:async';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/get_current_balance_response.dart';
import 'package:jadu_ride_driver/core/domain/response/km_recharge_amount_response.dart';
import 'package:jadu_ride_driver/core/domain/response/razorpay_necssary_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/walletdetails_response.dart';
import 'package:retrofit/http.dart';


 part 'kmBalanceApi.g.dart';

@RestApi()
abstract class KMBalanceApi{
  factory KMBalanceApi(Dio dio, {String baseUrl}) = _KMBalanceApi;


  @GET("${ApiRoutes.parent}/packages")
  Future<KmRechargeResponse> refillAmounts();
  
  
  @GET("${ApiRoutes.parent}/users/{userId}/currentPurchasedKm")
  Future<KilometerWalletResponse> kmDetails(
      @Path("userId") String userId);


  @GET("${ApiRoutes.parent}/users/{userId}/recharge/own")
  Future<RazorpayDataResponse> razorpayData(
      @Path("userId") String userId, @Query("selectedPackageId") String selectedPackageId);


  @GET("${ApiRoutes.parent}/users/{userId}/recharge/history")
  Future<GetCurrentBalanceResponse> getCBHistory(
      @Path("userId") String userId,
      @Query("date") String date

      );
}