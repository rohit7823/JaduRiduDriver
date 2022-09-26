
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/amount_transferred_response.dart';

import '../core/domain/amount_transferred_by_day_response.dart';
import '../core/repository/amount_transffered_by_day_repository.dart';

class AmountTransferredByDayRepositoryImpl implements AmountTransfferedByDayRepository {
  @override
  Future<Resource<GetAmountTransferredResponse>> getAmountTransferredResponse(String userInputId) async {
//GetAmountTransferredResponse
    await Future.delayed(const Duration(seconds: 2));
    return Success(GetAmountTransferredResponse(status: true, message: "Success",
        amountTransferredByDay: List.generate(5, (index) => AmountTransferredByDayResponseClass(date: "Monday 18th June , 2022", time: "5:39 PM", price: 400.00))));
  }
  
}