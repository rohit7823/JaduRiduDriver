import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

RequiredDataWelcomeJaduRideResponse requiredDataWelcomeJaduRideResponseFromJson(
        String str) =>
    RequiredDataWelcomeJaduRideResponse.fromJson(json.decode(str));

String requiredDataWelcomeJaduRideResponseToJson(
        RequiredDataWelcomeJaduRideResponse data) =>
    json.encode(data.toJson());

class RequiredDataWelcomeJaduRideResponse extends BusinessObject {
  RequiredDataWelcomeJaduRideResponse(
      {required this.status,
      required this.message,
      required this.mobileNumber,
      required this.states,
      required this.numberCodes});

  bool status;
  String message;
  String mobileNumber;
  List<Package> states;
  List<MobileNumberCode> numberCodes;

  factory RequiredDataWelcomeJaduRideResponse.fromJson(
          Map<String, dynamic> json) =>
      RequiredDataWelcomeJaduRideResponse(
        status: json["status"],
        message: json["message"],
        mobileNumber: json["mobile"],
        numberCodes: List<MobileNumberCode>.from(
            json["countryCodes"].map((x) => MobileNumberCode.fromJson(x))),
        states:
            List<Package>.from(json["states"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "mobile": mobileNumber,
        "countryCodes": List<dynamic>.from(numberCodes.map((x) => x.toJson())),
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
      };
}
