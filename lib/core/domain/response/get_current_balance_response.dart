import '../current_balance_dates.dart';

class GetCurrentBalanceResponse {
  GetCurrentBalanceResponse(
      {required this.status,
      required this.message,
      required this.currentBalanceDates});

  bool status;
  String message;
  List<CurrentBalanceDates> currentBalanceDates;
}
