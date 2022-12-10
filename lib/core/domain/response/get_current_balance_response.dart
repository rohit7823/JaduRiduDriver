

class GetCurrentBalanceResponse {
  GetCurrentBalanceResponse(
      {required this.status,
      required this.message,
      required this.currentBalanceHistory});

  final bool status;
  final String message;
  List<CurrentBalanceHistory> currentBalanceHistory;


}
class CurrentBalanceHistory{
  String transactiondate;
  String title;
  String sub_title;
  String price;
  String amountmethod;


  CurrentBalanceHistory({
    required this.transactiondate,
    required this.title,
    required this.sub_title,
    required this.amountmethod,
    required this.price});
}