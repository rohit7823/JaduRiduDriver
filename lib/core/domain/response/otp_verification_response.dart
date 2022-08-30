import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class OtpVerificationResponse extends BusinessObject {
  bool status;
  String message;
  bool isVerified;
  String userId;

  OtpVerificationResponse(
      {required this.status,
      required this.message,
      required this.isVerified,
      required this.userId});
}
