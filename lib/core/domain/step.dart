class DetailStep {
  String key;
  bool isComplete;

  DetailStep({required this.key, required this.isComplete});

  factory DetailStep.fromJson(Map<String, dynamic> json) => DetailStep(
        key: json["id"],
        isComplete: json["isComplete"],
      );

  Map<String, dynamic> toJson() => {
        "id": key,
        "isComplete": isComplete,
      };
}
