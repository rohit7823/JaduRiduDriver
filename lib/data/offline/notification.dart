import 'package:objectbox/objectbox.dart';

@Entity()
class AppNotification {
  int id;
  String? image;
  String message;
  String date;
  String redirectionID;
  AppNotification(
      {this.id = 0,
      required this.image,
      required this.message,
      required this.date,
      required this.redirectionID});

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      AppNotification(
        image: json["image"],
        message: json["message"],
        date: json["date"],
        redirectionID: json["redirectionID"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "message": message,
        "date": date,
        "redirectionID": redirectionID
      };
}
