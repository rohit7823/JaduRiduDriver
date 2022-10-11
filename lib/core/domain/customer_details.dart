class CustomerDetails {
  String name;
  String image;
  double rating;

  CustomerDetails(
      {required this.name, required this.image, required this.rating});

  factory CustomerDetails.fromJson(Map<String, dynamic> json) =>
      CustomerDetails(
        name: json["name"],
        image: json["image"],
        rating: json["rating"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "rating": rating,
      };
}
