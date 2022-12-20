class MobileNumberCode {
  final String id;
  final String countryImage;
  final String code;

  MobileNumberCode(
      {required this.id,
        required this.countryImage,
        required this.code});

  factory MobileNumberCode.fromJson(Map<String, dynamic> json) =>
      MobileNumberCode(
        id: json["id"],
        countryImage: json["countryImage"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "countryImage": countryImage,
        "code": code,
      };
}
