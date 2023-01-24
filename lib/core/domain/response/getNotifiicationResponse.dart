import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/domain/response/about_notification_response.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../amount_transferred_by_day_response.dart';

GetNotificationResponse getNotificationResponseFromJson(String str) =>
    GetNotificationResponse.fromJson(json.decode(str));

String getNotificationResponseToJson(GetNotificationResponse data) =>
    json.encode(data.toJson());

class GetNotificationResponse extends BusinessObject {
  bool status;
  String message;
  List<NotificationResponseClass> notifications;

  GetNotificationResponse(
      {required this.status,
      required this.message,
      required this.notifications});

  factory GetNotificationResponse.fromJson(Map<String, dynamic> json) =>
      GetNotificationResponse(
        status: json["status"],
        message: json["message"],
        notifications: List<NotificationResponseClass>.from(
            json["notifications"]
                .map((x) => NotificationResponseClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "notifications": List<dynamic>.from(notifications.map((x) => x)),
      };
}
