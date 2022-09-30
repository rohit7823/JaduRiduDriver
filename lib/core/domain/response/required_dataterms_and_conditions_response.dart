import 'business_object.dart';

class RequiredDataTermsAndConditionsResponse extends BusinessObject{

  bool status;
  String message;
  String termsConditionsTxt;

  RequiredDataTermsAndConditionsResponse({required this.status, required this.message, required this.termsConditionsTxt});

}