import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';

class AlertData<T> {
  String title;
  Image? icon;
  String id;
  String message;
  String? positive;
  String? negative;
  String? neutral;
  T? data;

  AlertData(this.title, this.icon, this.id, this.message, this.positive,
      this.negative, this.neutral, this.data);
}
