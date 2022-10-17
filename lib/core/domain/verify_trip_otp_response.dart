import 'dart:convert';

VerifyTripOtpResponse verifyTripOtpResponseFromJson(String str) =>
    VerifyTripOtpResponse.fromJson(json.decode(str));

String verifyTripOtpResponseToJson(VerifyTripOtpResponse data) =>
    json.encode(data.toJson());

class VerifyTripOtpResponse {
  bool status;
  String msg;

  VerifyTripOtpResponse({required this.msg, required this.status});

  factory VerifyTripOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyTripOtpResponse(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
