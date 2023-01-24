class NotificationResponseClass{
  String time;
  String info;
  String imagepath;
  NotificationResponseClass({required this.time, required this.info, required this.imagepath});



  factory NotificationResponseClass.fromJson(Map<String, dynamic> json) =>
      NotificationResponseClass(
        time: json["time"],
        info: json["info"],
        imagepath: json["imagepath"],
      );

  Map<String, dynamic> toJson() => {
    "time": time,
    "info": info,
    "imagepath": imagepath,
  };

}