class LocationSchedule {
  String date;
  String time;
  String pickUpLocation;
  String dropLocation;

  LocationSchedule(
      {required this.date,
      required this.time,
      required this.pickUpLocation,
      required this.dropLocation});

  factory LocationSchedule.fromJson(Map<String, dynamic> json) =>
      LocationSchedule(
        date: json["date"],
        time: json["time"],
        pickUpLocation: json["pickUpLocation"],
        dropLocation: json["dropLocation"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "pickUpLocation": pickUpLocation,
        "dropLocation": dropLocation,
      };
}
