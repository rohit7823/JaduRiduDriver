import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

KilometerWalletResponse kilometerWalletResponseFromJson(String str) => KilometerWalletResponse.fromJson(json.decode(str));

String kilometerWalletResponseToJson(KilometerWalletResponse data) => json.encode(data.toJson());

class KilometerWalletResponse extends BusinessObject {
  KilometerWalletResponse({
    required this.status,
    required this.message,
    required this.currentPurchasedKm,
  });

  final bool status;
  final String message;
  final String currentPurchasedKm;

  factory KilometerWalletResponse.fromJson(Map<String, dynamic> json) => KilometerWalletResponse(
    status: json["status"],
    message: json["message"],
    currentPurchasedKm: json["currentPurchasedKm"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "currentPurchasedKm": currentPurchasedKm,
  };
}

