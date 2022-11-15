class AccountSummery {
  bool isLow;
  String currentKm;
  int onlineCollected;
  int cashCollected;

  AccountSummery(
      {required this.isLow,
      required this.currentKm,
      required this.cashCollected,
      required this.onlineCollected});


  factory AccountSummery.fromJson(Map<String, dynamic> json) => AccountSummery(
    isLow: json["isLow"],
    currentKm: json["currentKm"],
    onlineCollected: json["onlineCollected"],
    cashCollected: json["cashCollected"],
  );

  Map<String, dynamic> toJson() => {
    "isLow": isLow,
    "currentKm": currentKm,
    "onlineCollected": onlineCollected,
    "cashCollected": cashCollected,
  };
}
