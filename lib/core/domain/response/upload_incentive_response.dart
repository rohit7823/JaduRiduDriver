
import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../incentive.dart';

CollectCouponResponse collectCoupOnResponseFromJson(String str) => CollectCouponResponse.fromJson(json.decode(str));

String collectCoupOnResponseToJson(CollectCouponResponse data) => json.encode(data.toJson());

class CollectCouponResponse  extends BusinessObject{
  CollectCouponResponse({
    required this.status,
    required this.message,
    required this.incentives,
  });

  final bool status;
  final String message;
  final List<Incentive> incentives;

  factory CollectCouponResponse.fromJson(Map<String, dynamic> json) => CollectCouponResponse(
    status: json["status"],
    message: json["message"],
    incentives: List<Incentive>.from(json["incentives"].map((x) => Incentive.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "incentives": List<dynamic>.from(incentives.map((x) => x.toJson())),
  };
}
