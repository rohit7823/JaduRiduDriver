import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';


class WalletRechargeAmountResponse extends BusinessObject {
  bool status;
  String message;
  List<Package> amount;

  WalletRechargeAmountResponse(
      {required this.status, required this.message, required this.amount});

  factory WalletRechargeAmountResponse.fromJson(Map<String, dynamic> json) =>
      WalletRechargeAmountResponse(
        status: json["status"],
        message: json["message"],
        amount: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "packages": List<dynamic>.from(amount.map((x) => x.toJson())),
  };
}
