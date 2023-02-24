class ExpiredDocumentAlert {
  List<String> keys;
  bool isSkippable;
  String message;
  bool giveAlert;

  ExpiredDocumentAlert(
      {required this.keys, required this.message,
      required this.isSkippable,
        required this.giveAlert});

  factory ExpiredDocumentAlert.fromJson(Map<String, dynamic> json) => ExpiredDocumentAlert(
      keys: List<String>.from(json["keys"].map((x) => x)),
      message: json["message"],
      isSkippable: json["isSkippable"],
      giveAlert: json["giveAlert"]
  );
}
