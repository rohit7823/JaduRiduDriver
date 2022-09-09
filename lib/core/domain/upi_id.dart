class UpiID {
  String id;
  String name;
  UpiID({required this.id, required this.name});


  factory UpiID.fromJson(Map<String, dynamic> json) => UpiID(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
