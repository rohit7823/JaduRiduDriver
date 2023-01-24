import 'business_object.dart';

class RequiredDataTermsAndConditionsResponse extends BusinessObject{

  bool status;
  String message;
  String termsConditionsTxt;

  RequiredDataTermsAndConditionsResponse({required this.status, required this.message, required this.termsConditionsTxt});


  factory RequiredDataTermsAndConditionsResponse.fromJson(Map<String, dynamic> json) =>
      RequiredDataTermsAndConditionsResponse(
        status: json["status"],
        message: json["message"],
        termsConditionsTxt: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "description": termsConditionsTxt,
  };
}