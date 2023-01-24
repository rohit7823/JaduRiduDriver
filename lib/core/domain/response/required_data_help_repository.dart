import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class RequiredDataHelpResponse extends BusinessObject{
  bool status;
  String message;
  String helpPhoneNumber;

  RequiredDataHelpResponse({required this.status, required this.message, required this.helpPhoneNumber});
  factory RequiredDataHelpResponse.fromJson(Map<String, dynamic> json) =>
      RequiredDataHelpResponse(
        status: json["status"],
        message: json["message"],
        helpPhoneNumber: json["helplineNumber"],
      );

}