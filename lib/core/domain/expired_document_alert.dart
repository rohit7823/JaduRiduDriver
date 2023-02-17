class ExpiredDocumentAlert {
  String key;
  bool isSkippable;
  String message;

  ExpiredDocumentAlert(
      {required this.message,
      required this.isSkippable,
      required this.key});
}
