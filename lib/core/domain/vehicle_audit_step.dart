class VehicleAuditStep {
  String stepKey;
  String name;
  bool isCompleted;

  VehicleAuditStep(
      {required this.stepKey, required this.name, required this.isCompleted});

  factory VehicleAuditStep.fromJson(Map<String, dynamic> json) =>
      VehicleAuditStep(
        stepKey: json["stepKey"],
        name: json["name"],
        isCompleted: json["isComplete"],
      );

  Map<String, dynamic> toJson() => {
        "stepKey": stepKey,
        "name": name,
        "isComplete": isCompleted,
      };
}
