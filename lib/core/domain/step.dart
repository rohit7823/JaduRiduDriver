class DetailStep {
  String key;
  bool isComplete;
  bool isRejected;
  bool isPending;

  DetailStep({required this.key, required this.isComplete, required this.isRejected, required this.isPending});

  factory DetailStep.fromJson(Map<String, dynamic> json) => DetailStep(
        key: json["id"],
        isComplete: json["isComplete"],
        isRejected: json["isRejected"] ?? false,
        isPending: json["isPending"] ?? false
      );

  Map<String, dynamic> toJson() => {
        "id": key,
        "isComplete": isComplete,
        "isRejected": isRejected
      };
}
