class CarCategory {
  String id;
  String name;

  CarCategory({required this.id, required this.name});

  factory CarCategory.fromJson(Map<String, dynamic> json) =>
      CarCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
