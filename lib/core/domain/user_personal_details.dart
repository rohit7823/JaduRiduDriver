class UserPersonalDetails {
  String name;
  String email;

  UserPersonalDetails({required this.name, required this.email});

  factory UserPersonalDetails.fromJson(Map<String, dynamic> json) =>
      UserPersonalDetails(
        name: json["name"] ?? "",
        email: json["email"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
