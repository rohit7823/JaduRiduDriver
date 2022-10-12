class CustomerDetails {
  String id;
  String name;
  String image;
  double rating;

  CustomerDetails(
      {required this.id,
      required this.name,
      required this.image,
      required this.rating});

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      CustomerDetails(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "rating": rating,
      };
}
