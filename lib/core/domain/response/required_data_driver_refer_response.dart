

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../driver_refer.dart';

class RequiredDataDriverReferResponse extends BusinessObject{
  bool status;
  String message;
  DriverRefer driverRefers;

  RequiredDataDriverReferResponse({required this.status, required this.message, required this.driverRefers});

  factory RequiredDataDriverReferResponse.fromJson(Map<String, dynamic> json) => RequiredDataDriverReferResponse(
    status: json["status"],
    message: json["message"],
    driverRefers: DriverRefer(
        driverToDriver: json["referredDriverCount"],
        driverToCustomar: json["referredCustomerCount"],
        driverToDriverReferCode: json["driverReferralCode"],
        driverToCustomarReferCode: json["customerReferralCode"]
    ),
  );

}