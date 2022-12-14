


import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

GetCurrentBalanceResponse getCurrentBalanceResponseFromJson(String str) => GetCurrentBalanceResponse.fromJson(json.decode(str));

String getCurrentBalanceResponseToJson(GetCurrentBalanceResponse data) => json.encode(data.toJson());

class GetCurrentBalanceResponse  extends BusinessObject{
  GetCurrentBalanceResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<Datum> data;

  factory GetCurrentBalanceResponse.fromJson(Map<String, dynamic> json) => GetCurrentBalanceResponse(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.rechargeType,
    required this.title,
    required this.price,
    required this.description,
    required this.transactionDate,
    required this.colorCode,
  });

  final String rechargeType;
  final String title;
  final String price;
  final String description;
  final String transactionDate;
  final String colorCode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    rechargeType: json["rechargeType"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    transactionDate: json["transactionDate"],
    colorCode: json["color_code"],
  );

  Map<String, dynamic> toJson() => {
    "rechargeType": rechargeType,
    "title": title,
    "price": price,
    "description": description,
    "transactionDate": transactionDate,
    "color_code": colorCode,
  };
}


