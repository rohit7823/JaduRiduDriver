import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';



ShortBookingsSummaryResponse shortBookingsSummaryResponseFromJson(String str) => ShortBookingsSummaryResponse.fromJson(json.decode(str));

String shortBookingsSummaryResponseToJson(ShortBookingsSummaryResponse data) => json.encode(data.toJson());

class ShortBookingsSummaryResponse  extends BusinessObject{
  ShortBookingsSummaryResponse({
    required this.status,
    required this.message,
    required this.bookingCount,
    required this.operatorBill,
    required this.updateDateTime,
  });

   bool status;
   String message;
   int bookingCount;
   int operatorBill;
  String updateDateTime;

  factory ShortBookingsSummaryResponse.fromJson(Map<String, dynamic> json) => ShortBookingsSummaryResponse(
    status: json["status"],
    message: json["message"],
    bookingCount: json["bookingCount"],
    operatorBill: json["operatorBill"],
    updateDateTime: json["updateDateTime"],
  );

  //get bookingsSummary => null;

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "bookingCount": bookingCount,
    "operatorBill": operatorBill,
    "updateDateTime": updateDateTime,
  };
}