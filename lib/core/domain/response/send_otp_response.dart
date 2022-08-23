class SendOtpResponse {
  bool status;
  String message;
  bool isSend;

  SendOtpResponse(
      {required this.status, required this.message, required this.isSend});
}
