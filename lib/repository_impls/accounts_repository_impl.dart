import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/account_summery.dart';
import 'package:jadu_ride_driver/core/domain/response/account_summary_response.dart';
import 'package:jadu_ride_driver/core/repository/accounts_repository.dart';
import 'package:jadu_ride_driver/data/online/account_summary_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/domain/response/upload_accounts_response.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final Dio _dio;
  late final AccountSummaryApi _accountSummaryApi;

  AccountsRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _accountSummaryApi = AccountSummaryApi(_dio);
  }

  @override
  Future<Resource<AccountsSummeryResponse>> getAccountSummery(String userId) async{
        return await _accountSummaryApi
        .accountSummary(userId)
        .handleResponse<AccountsSummeryResponse>();
  }

  // @override
  // Future<Resource<AccountSummaryResponse>> getAccountSummary(
  //     String userId, bool isLow, String currentKm, String onlineCollected, String cashCollected) async {
  //     return await _accountSummaryApi
  //         .accountSummary()
  //         .handleResponse<AccountSummaryResponse>();

    // await Future.delayed(const Duration(seconds: 2));
    // return Success(AccountsSummeryResponse(
    //     status: true,
    //     message: "Success",
    //     accountSummery: AccountSummery(
    //        isLow: true,
    //         currentKm: "2000",
    //         cashCollected: "260",
    //         onlineCollected: "560")));
  }






