import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/km_recharge_amount_response.dart';
import 'package:jadu_ride_driver/core/domain/response/razorpay_necssary_data_response.dart';
import 'package:retrofit/http.dart';


 part 'kmBalanceApi.g.dart';

@RestApi()
abstract class KMBalanceApi{
  factory KMBalanceApi(Dio dio, {String baseUrl}) = _KMBalanceApi;


  @GET("${ApiRoutes.parent}/packages")
  Future<KmRechargeResponse> refillAmounts();


  @GET("${ApiRoutes.parent}/{userId}/recharge")
  Future<RazorpayDataResponse> razorpayData(
      @Path("userId") String userId, @Query("packageId") String packageId);
}