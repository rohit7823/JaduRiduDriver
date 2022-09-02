class AppVersion {
  String message;
  int code;
  String date;
  String url;
  bool isSkipable;

  AppVersion(
      {required this.message,
      required this.code,
      required this.date,
      required this.url,
      required this.isSkipable});

  factory AppVersion.fromJson(Map<String, dynamic> json) => AppVersion(
        message: json["name"],
        code: json["code"],
        date: json["date"],
        url: json["url"],
        isSkipable: json["isSkipable"],
      );

  Map<String, dynamic> toJson() => {
        "name": message,
        "code": code,
        "date": date,
        "url": url,
        "isSkipable": isSkipable,
      };
}
