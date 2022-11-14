import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../account_summery.dart';

class AccountsSummeryResponse extends BusinessObject {

  AccountsSummeryResponse(
      {required this.status,
      required this.message,
      required this.accountSummery});

  bool status;
  String message;
  AccountSummery accountSummery;


  factory AccountsSummeryResponse.fromJson(Map<String, dynamic> json) => AccountsSummeryResponse(
    status: json["status"],
    message: json["message"],
    accountSummery: AccountSummery.fromJson(json["summery"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "summery": accountSummery.toJson(),
  };
}
