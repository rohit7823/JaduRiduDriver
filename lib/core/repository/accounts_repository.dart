
import 'package:jadu_ride_driver/core/domain/account_summery.dart';

import '../common/response.dart';
import '../domain/response/upload_accounts_response.dart';

abstract class AccountsRepository {
  Future<Resource<AccountsSummeryResponse>> getAccountSummery(String userId);
}