class BookingAccepted {
  String status;
  String msg;
  BookingAccepted({required this.status, required this.msg});

  factory BookingAccepted.fromJson(Map<String, dynamic> json) =>
      BookingAccepted(
        status: json["status"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
      };
}
