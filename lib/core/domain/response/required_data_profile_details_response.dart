// import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
// import '../mobile_number_code.dart';
// import '../package.dart';
//
// class RequiredDataProfileDetailsResponse extends BusinessObject{
//   bool status;
//   String message;
//   String name;
//   String email;
//   List<MobileNumberCode> numberCodes;
//   String mobileNumber;
//   List<Package> states;
//   String gender;
//   String dob;
//   String profileImage;
//
//
//   RequiredDataProfileDetailsResponse({
//     required this.status,
//     required this.message,
//     required this.name,
//     required this.numberCodes,
//     required this.dob,
//     required this.email,
//     required this.gender,
//     required this.mobileNumber,
//     required this.profileImage,
//     required this.states});
//
//
// }

import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../mobile_number_code.dart';
import '../package.dart';

FetchProfileDetailsResponse fetchProfileDetailsResponseFromJson(String str) =>
    FetchProfileDetailsResponse.fromJson(json.decode(str));

String fetchProfileDetailsResponseToJson(FetchProfileDetailsResponse data) =>
    json.encode(data.toJson());

class FetchProfileDetailsResponse extends BusinessObject {
  FetchProfileDetailsResponse({
    required this.status,
    required this.message,
    required this.name,
    required this.email,
    required this.numberCode,
    required this.mobile,
    required this.states,
    required this.gender,
    required this.dob,
    required this.image,
  });

  final bool status;
  final String message;
  final String name;
  final String email;
  MobileNumberCode numberCode;
  final String mobile;
  List<Package> states;
  final String gender;
  final String dob;
  String image;

  factory FetchProfileDetailsResponse.fromJson(Map<String, dynamic> json) =>
      FetchProfileDetailsResponse(
        status: json["status"],
        message: json["message"],
        name: json["name"],
        email: json["email"],
        numberCode: MobileNumberCode.fromJson(json["numberCode"]),
        mobile: json["mobile"],
        states:
            List<Package>.from(json["states"].map((x) => Package.fromJson(x))),
        gender: json["gender"] ?? "",
        dob: json["dob"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "name": name,
        "email": email,
        "numberCode": numberCode.toJson(),
        "mobile": mobile,
        "states": List<dynamic>.from(states.map((x) => x.toJson())),
        "gender": gender,
        "dob": dob,
        "image": image,
      };
}
