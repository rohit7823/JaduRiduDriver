import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import 'package:jadu_ride_driver/core/domain/user_short_detail.dart';

class ShortProfileDetailResponse extends BusinessObject {
  bool status;
  String message;
  UserShortDetail details;


  ShortProfileDetailResponse ({
    required this.status,
    required this.message,
    required this.details});

  factory ShortProfileDetailResponse.fromJson(Map<String, dynamic> json) => ShortProfileDetailResponse (
    status: json["status"],
    message: json["message"],
    details: UserShortDetail.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "details": details.toJson(),
  };
}