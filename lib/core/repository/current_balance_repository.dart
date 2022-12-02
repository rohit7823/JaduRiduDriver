import 'package:jadu_ride_driver/core/domain/response/kilometer_recharge_response.dart';
import 'package:jadu_ride_driver/core/domain/response/razorpay_necssary_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/wallet_recharge_amount_response.dart';
import 'package:jadu_ride_driver/core/domain/response/walletdetails_response.dart';

import '../common/response.dart';
import '../domain/response/all_dates_response.dart';
import '../domain/response/get_current_balance_response.dart';

abstract class CurrentBalanceRepository {
  Future<Resource<AllDatesListsResponse>> allDatesResponse(String userId);
  Future<Resource<GetCurrentBalanceResponse>> uploadCurrentBalanceResponse(String userId, String id);


  Future<Resource<DriverWalletResponse>> walletDetails(String userId);

  Future<Resource<KmRechargeResponse>> walletRechargeAmounts(String userId);

  Future<Resource<RazorpayNecessaryDataResponse>> fetchRazorpayData(String userId, String packageId);
}