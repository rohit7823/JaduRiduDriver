import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/account_summery.dart';
import 'package:jadu_ride_driver/core/repository/accounts_repository.dart';

import '../core/domain/response/upload_accounts_response.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  @override
  Future<Resource<AccountsSummeryResponse>> getAccountSummery(
      String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(AccountsSummeryResponse(
        status: true,
        message: "Success",
        accountSummery: AccountSummery(
            balanceLow: true,
            currentBalance: "2000",
            cashCollectPrice: "260",
            onlineCollectPrice: "560")));
  }
}
