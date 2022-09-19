import '../account_summery.dart';

class AccountsSummeryResponse {
  AccountsSummeryResponse(
      {required this.status,
      required this.message,
      required this.accountSummery});

  bool status;
  String message;
  AccountSummery accountSummery;
}
