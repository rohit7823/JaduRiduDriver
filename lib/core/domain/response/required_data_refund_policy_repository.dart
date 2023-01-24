
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class RequiredDataRefundPolicyResponse extends BusinessObject{

  bool status;
  String message;
  String refundPolicyTxt;

  RequiredDataRefundPolicyResponse({required this.status, required this.message, required this.refundPolicyTxt});

  factory RequiredDataRefundPolicyResponse.fromJson(Map<String, dynamic> json) =>
      RequiredDataRefundPolicyResponse(
        status: json["status"],
        message: json["message"],
        refundPolicyTxt: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "description": refundPolicyTxt,
  };
}