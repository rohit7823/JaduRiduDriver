
import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/domain/response/about_notification_response.dart';

import '../amount_transferred_by_day_response.dart';

class GetNotificationResponse{
  bool status;
  String message;
  List<NotificationResponseClass> notificationlist;

  GetNotificationResponse({required this.status, required this.message,required this.notificationlist});
}