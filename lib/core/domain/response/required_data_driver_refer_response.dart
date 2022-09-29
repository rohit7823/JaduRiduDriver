

import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

import '../driver_refer.dart';

class RequiredDataDriverReferResponse extends BusinessObject{
  bool status;
  String message;
  DriverRefer driverRefers;

  RequiredDataDriverReferResponse({required this.status, required this.message, required this.driverRefers});
}