class UpiValidateResponse {
  bool status;
  String message;
  bool isValid;

  UpiValidateResponse(
      {required this.status, required this.message, required this.isValid});
}
