class AccountStatus {
  String status;
  String message;

  AccountStatus({required this.status, required this.message});

  factory AccountStatus.fromJson(Map<String, dynamic> json) => AccountStatus(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
