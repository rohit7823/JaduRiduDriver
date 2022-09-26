import '../common/response.dart';
import '../domain/response/amount_transferred_response.dart';
abstract class AmountTransfferedByDayRepository{
  Future<Resource<GetAmountTransferredResponse>> getAmountTransferredResponse(String userInputId);
}