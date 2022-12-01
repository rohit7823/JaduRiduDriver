class WalletDetails {
  int amount;
  bool isAvailable;

  WalletDetails({required this.amount, required this.isAvailable});

  factory WalletDetails.fromJson(Map<String, dynamic> json) => WalletDetails(
    amount: json["amount"],
    isAvailable: json["isAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "isAvailable": isAvailable,
  };
}
