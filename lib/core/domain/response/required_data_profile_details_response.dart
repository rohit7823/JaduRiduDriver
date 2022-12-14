import 'package:jadu_ride_driver/core/domain/response/business_object.dart';
import '../mobile_number_code.dart';
import '../package.dart';

class RequiredDataProfileDetailsResponse extends BusinessObject{
  bool status;
  String message;
  String name;
  String email;
  List<MobileNumberCode> numberCodes;
  String mobileNumber;
  List<Package> states;
  String gender;
  String dob;
  String profileImage;


  RequiredDataProfileDetailsResponse({
    required this.status,
    required this.message,
    required this.name,
    required this.numberCodes,
    required this.dob,
    required this.email,
    required this.gender,
    required this.mobileNumber,
    required this.profileImage,
    required this.states});


}