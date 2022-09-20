import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_current_balance_response.dart';

import '../core/domain/current_balance_dates.dart';
import '../core/repository/current_balance_repository.dart';

class CurrentBalanceRepositoryImpl implements CurrentBalanceRepository {
  @override
  Future<Resource<UploadCurrentBalanceResponse>> uploadCurrentBalanceResponse(
      String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(UploadCurrentBalanceResponse(
        status: true,
        message: "Success",
        currentBalanceDates: List.generate(
            5, (index) => CurrentBalanceDates(dates: "June 27, 20222"))));
  }
}
