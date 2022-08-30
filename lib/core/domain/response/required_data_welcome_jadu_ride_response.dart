import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class RequiredDataWelcomeJaduRideResponse extends BusinessObject {
  bool status;
  String message;
  String mobileNumber;
  List<Package> states;
  List<MobileNumberCode> numberCodes;

  RequiredDataWelcomeJaduRideResponse(
      {required this.status,
      required this.message,
      required this.mobileNumber,
      required this.states,
      required this.numberCodes});
}
