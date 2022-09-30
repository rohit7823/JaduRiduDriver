
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class RequiredDataPrivacyPolicyResponse extends BusinessObject{
  bool status;
  String message;
  String privacyPolicyTxt;

  RequiredDataPrivacyPolicyResponse({required this.status, required this.message, required this.privacyPolicyTxt});
}