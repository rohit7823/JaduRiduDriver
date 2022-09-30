
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class RequiredDataEmergencyResponse extends BusinessObject{
  bool status;
  String message;
  String emergencyPhoneNumber;

  RequiredDataEmergencyResponse({required this.status, required this.message, required this.emergencyPhoneNumber});
}