
import 'dart:convert';

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../location_schedule.dart';

LocationScheduleResponse locationScheduleResponseFromJson(String str) => LocationScheduleResponse.fromJson(json.decode(str));

String locationScheduleResponseToJson(LocationScheduleResponse data) => json.encode(data.toJson());

class LocationScheduleResponse extends BusinessObject{
  LocationScheduleResponse({
    required this.status,
    required this.message,
    required this.scheduleList,
  });

  final bool status;
  final String message;
  final List<LocationSchedule> scheduleList;

  factory LocationScheduleResponse.fromJson(Map<String, dynamic> json) => LocationScheduleResponse(
    status: json["status"],
    message: json["message"],
    scheduleList: List<LocationSchedule>.from(json["scheduleTripData"].map((x) => LocationSchedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "scheduleTripData": List<dynamic>.from(scheduleList.map((x) => x.toJson())),
  };
}