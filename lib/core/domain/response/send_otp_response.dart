import 'dart:convert';

SendOtpResponse sendOtpResponseFromJson(String str) =>
    SendOtpResponse.fromJson(json.decode(str));

String sendOtpResponseToJson(SendOtpResponse data) =>
    json.encode(data.toJson());

class SendOtpResponse {
  SendOtpResponse(
      {required this.status, required this.message, required this.isSend});

  bool status;
  String message;
  bool isSend;

  factory SendOtpResponse.fromJson(Map<String, dynamic> json) =>
      SendOtpResponse(
        status: json["status"],
        message: json["message"],
        isSend: json["isSent"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "isSent": isSend,
      };
}
