class Incentive {
  Incentive({
    required this.heading,
    required this.body,
    required this.amount,
  });

  final String heading;
  final String body;
  final String amount;

  factory Incentive.fromJson(Map<String, dynamic> json) => Incentive(
    heading: json["heading"],
    body: json["body"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "heading": heading,
    "body": body,
    "amount": amount,
  };
}