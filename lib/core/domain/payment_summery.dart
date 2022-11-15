class RechargeHistory {
  RechargeHistory({
    required this.transationAt,
    required this.paymentMode,
    required this.amount,
    required this.ride_id,
    required this.customerName,
  });

  final String transationAt;
  final String paymentMode;
  final String amount;
  final String ride_id;
  final String customerName;

  factory RechargeHistory.fromJson(Map<String, dynamic> json) => RechargeHistory(
    transationAt:json["transationAt"],
    paymentMode:json["paymentMode"],
    amount: json["amount"],
    ride_id: json["ride_id"],
    customerName:json["customerName"],
  );

  Map<String, dynamic> toJson() => {
    "transationAt":transationAt,
    "paymentMode": paymentMode,
    "amount": amount,
    "ride_id": ride_id,
    "customerName":customerName,
  };
}
