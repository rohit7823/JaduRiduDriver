class ExpiredDocumentAlert {
  String key;
  bool isSkippable;
  String message;
  bool giveAlert;

  ExpiredDocumentAlert(
      {required this.message,
      required this.isSkippable,
        required this.giveAlert,
      required this.key});
}
