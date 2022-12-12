import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/aboutwallet_response.dart';
import 'package:jadu_ride_driver/core/domain/response/all_dates_response.dart';
import 'package:jadu_ride_driver/core/domain/response/get_current_balance_response.dart';
import 'package:jadu_ride_driver/core/domain/response/km_recharge_amount_response.dart';

import 'package:jadu_ride_driver/core/domain/response/razorpay_necssary_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/wallet_recharge_amount_response.dart';
import 'package:jadu_ride_driver/core/domain/response/walletdetails_response.dart';
import 'package:jadu_ride_driver/data/online/kmBalanceApi.dart';

import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';


import '../core/domain/package.dart';
import '../core/repository/current_balance_repository.dart';

class CurrentBalanceRepositoryImpl implements CurrentBalanceRepository {

  final Dio _dio;
  late final KMBalanceApi _kmBalanceApi;

  CurrentBalanceRepositoryImpl(this._dio){
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _kmBalanceApi = KMBalanceApi(_dio);
  }



  @override
  Future<Resource<KilometerWalletResponse>> walletDetails(String userId)  async{
    return _kmBalanceApi
        .kmDetails(userId)
        .handleResponse<KilometerWalletResponse>();
  }


  @override
  Future<Resource<RazorpayDataResponse>> fetchRazorpayData(String userId, String selectedPackageId) async {
  return _kmBalanceApi
      .razorpayData(userId, selectedPackageId)
      .handleResponse<RazorpayDataResponse>();


  }



  @override
  Future<Resource<KmRechargeResponse>> walletRechargeAmounts(String userId) async {
    return _kmBalanceApi
        .refillAmounts()
        .handleResponse<KmRechargeResponse>();
  }



  @override
  Future<Resource<GetCurrentBalanceResponse>>
  allDatesResponse( String userId, String date) async {
    return _kmBalanceApi
            .getCBHistory(userId, date)
            .handleResponse<GetCurrentBalanceResponse>();

  }





}
