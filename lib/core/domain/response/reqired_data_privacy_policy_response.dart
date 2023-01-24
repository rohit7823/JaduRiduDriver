
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class RequiredDataPrivacyPolicyResponse extends BusinessObject{
  bool status;
  String message;
  String privacyPolicyTxt;

  RequiredDataPrivacyPolicyResponse({required this.status, required this.message, required this.privacyPolicyTxt});

  factory RequiredDataPrivacyPolicyResponse.fromJson(Map<String, dynamic> json) =>
      RequiredDataPrivacyPolicyResponse(
        status: json["status"],
        message: json["message"],
        privacyPolicyTxt: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "description": privacyPolicyTxt,
  };
}