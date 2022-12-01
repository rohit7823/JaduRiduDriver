import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/aboutwallet_response.dart';
import 'package:jadu_ride_driver/core/domain/response/all_dates_response.dart';
import 'package:jadu_ride_driver/core/domain/response/get_current_balance_response.dart';
import 'package:jadu_ride_driver/core/domain/response/razorpay_necssary_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/wallet_recharge_amount_response.dart';
import 'package:jadu_ride_driver/core/domain/response/walletdetails_response.dart';

import '../core/domain/current_balance_dates.dart';
import '../core/domain/package.dart';
import '../core/repository/current_balance_repository.dart';

class CurrentBalanceRepositoryImpl implements CurrentBalanceRepository {

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
  Future<Resource<RazorpayNecessaryDataResponse>> fetchRazorpayData(String userId, String packageId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RazorpayNecessaryDataResponse(
        status: true, message: "Success", data: {}));
  }

  @override
  Future<Resource<WalletRechargeAmountResponse>> walletRechargeAmounts(String userId) async{
    await Future.delayed(const Duration(seconds: 2));
    return Success(WalletRechargeAmountResponse(
        status: true,
        message: "Success", amount: [],
        )
    );
  }

  @override
  Future<Resource<DriverWalletResponse>> walletDetails(String userId)  async{
    await Future.delayed(const Duration(seconds: 2));

    return Success(DriverWalletResponse(
        status: true,
        message: "Success",
        details: WalletDetails(amount: 500, isAvailable: false)));
  }
}
