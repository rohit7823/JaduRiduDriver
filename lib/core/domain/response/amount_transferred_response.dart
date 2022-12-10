
import '../amount_transferred_by_day_response.dart';

class GetAmountTransferredResponse{
  bool status;
  String message;
  List<AmountTransferredByDayResponseClass> Transferredamount;

  GetAmountTransferredResponse({
    required this.status,
    required this.message,
    required this.Transferredamount});
}
