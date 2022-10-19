class CustomerWaitingTimer {
  int min;
  int second;

  CustomerWaitingTimer({required this.min, required this.second});

  factory CustomerWaitingTimer.fromJson(Map<String, dynamic> json) =>
      CustomerWaitingTimer(
        min: json["min"],
        second: json["second"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "second": second,
      };
}
