class MobileNumberCode {
  final String id;
  final String flag;
  final String code;

  MobileNumberCode(
      {required this.id,
        required this.flag,
        required this.code});

  factory MobileNumberCode.fromJson(Map<String, dynamic> json) =>
      MobileNumberCode(
        id: json["id"],
        flag:json["flag"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "flag": flag,
        "code": code,
      };
}
