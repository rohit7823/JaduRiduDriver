class MobileNumberCode {
  String id;
  String countryImage;
  String code;

  MobileNumberCode(
      {required this.id, required this.countryImage, required this.code});

  factory MobileNumberCode.fromJson(Map<String, dynamic> json) =>
      MobileNumberCode(
        id: json["id"],
        countryImage: json["flag"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "flag": countryImage,
        "code": code,
      };
}
