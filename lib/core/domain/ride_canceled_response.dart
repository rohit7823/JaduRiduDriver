import 'dart:convert';

RideCanceledResponse rideCanceledResponseFromJson(String str) =>
    RideCanceledResponse.fromJson(json.decode(str));

String rideCanceledResponseToJson(RideCanceledResponse data) =>
    json.encode(data.toJson());

class RideCanceledResponse {
  String rideStatus;
  String msg;
  bool isCanceled;

  RideCanceledResponse(
      {required this.rideStatus, required this.msg, required this.isCanceled});

  factory RideCanceledResponse.fromJson(Map<String, dynamic> json) =>
      RideCanceledResponse(
        rideStatus: json["rideStatus"],
        msg: json["statusMsg"],
        isCanceled: json["isCancelled"],
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "isCanceled": isCanceled,
      };
}
