

import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';


class KmRechargeResponse extends BusinessObject {
  KmRechargeResponse({
    required this.status,
    required this.message,
    required this.packages,
  });

  final bool status;
  final String message;
  final List<Package> packages;

  factory KmRechargeResponse.fromJson(Map<String, dynamic> json) => KmRechargeResponse(
    status: json["status"],
    message: json["message"],
    packages: List<Package>.from(json["packages"].map((x) => Package.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
  };
}