class OtpVerificationResponse {
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
