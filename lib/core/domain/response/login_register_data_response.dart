import 'dart:convert';

import '../login_registration_data.dart';

LoginRegisterDataResponse loginRegisterDataResponseFromJson(String str) =>
    LoginRegisterDataResponse.fromJson(json.decode(str));

String loginRegisterDataResponseToJson(LoginRegisterDataResponse data) =>
    json.encode(data.toJson());

class LoginRegisterDataResponse {
  LoginRegisterDataResponse(
      {required this.status, required this.message, required this.data});

  bool status;
  String message;
  LoginRegistrationData data;

  factory LoginRegisterDataResponse.fromJson(Map<String, dynamic> json) =>
      LoginRegisterDataResponse(
        status: json["status"],
        message: json["message"],
        data: LoginRegistrationData.fromJson(json["registrationData"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "registrationData": data.toJson(),
      };
}
