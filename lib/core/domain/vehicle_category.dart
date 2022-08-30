class VehicleCategory {
  String id;
  String name;

  VehicleCategory({required this.id, required this.name});

  factory VehicleCategory.fromJson(Map<String, dynamic> json) =>
      VehicleCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
