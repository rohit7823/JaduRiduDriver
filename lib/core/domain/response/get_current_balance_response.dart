

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
  String tdates;
  String title;
  String sub_title;
  double price;
  String amountmethod;


  CurrentBalanceHistory({
    required this.tdates,
    required this.title,
    required this.sub_title,
    required this.amountmethod,
    required this.price});
}