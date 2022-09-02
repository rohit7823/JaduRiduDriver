class LoginRegistrationData {
  String coverImage;
  String heading;
  String description;

  LoginRegistrationData(
      {required this.coverImage,
      required this.heading,
      required this.description});

  factory LoginRegistrationData.fromJson(Map<String, dynamic> json) =>
      LoginRegistrationData(
        heading: json["heading"],
        description: json["description"],
        coverImage: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "heading": heading,
        "description": description,
        "image": coverImage,
      };
}
