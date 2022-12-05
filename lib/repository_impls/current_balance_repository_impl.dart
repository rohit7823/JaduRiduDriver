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

import '../core/domain/current_balance_dates.dart';
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
  Future<Resource<AllDatesListsResponse>> allDatesResponse(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(AllDatesListsResponse(
        status: true,
        message: "Success",
        allDatesList: List.generate(10, (index) => Package(id: "${index + 1}", name: "June ${index + 17} , 2022"))));
  }

  @override
  Future<Resource<GetCurrentBalanceResponse>> uploadCurrentBalanceResponse(
      String userId, String id) async {
    await Future.delayed(const Duration(seconds: 1));
    return Success(GetCurrentBalanceResponse(
        status: true,
        message: "Success",
        currentBalanceDates: List.generate(
            3, (index) => CurrentBalanceDates(dates: "June 27", title: "Recived", sub_title: "Lorem Ipsum is simply dummy", price: 1050))));
  }





  @override
  Future<Resource<DriverWalletResponse>> walletDetails(String userId)  async{
    await Future.delayed(const Duration(seconds: 2));

    return Success(DriverWalletResponse(
        status: true,
        message: "Success",
        details: WalletDetails(amount: 500, isAvailable: false)));
  }


  @override
  Future<Resource<RazorpayDataResponse>> fetchRazorpayData(String userId, String packageId) async {
    // await Future.delayed(const Duration(seconds: 2));
    // return Success(RazorpayNecessaryDataResponse(
    //     status: true, message: "Success", data: {}));
  return _kmBalanceApi
      .razorpayData(userId, packageId)
      .handleResponse<RazorpayDataResponse>();


  }



  @override
  Future<Resource<KmRechargeResponse>> walletRechargeAmounts(String userId) async {
    return _kmBalanceApi
        .refillAmounts()
        .handleResponse<KmRechargeResponse>();
  }

}
