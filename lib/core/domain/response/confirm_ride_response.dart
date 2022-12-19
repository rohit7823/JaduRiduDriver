class ConfirmRideResponse {
  bool status;
  String message;
  String rideId;

  ConfirmRideResponse(
      {required this.status, required this.message, required this.rideId});

  factory ConfirmRideResponse.fromJson(Map<String, dynamic> json) => ConfirmRideResponse(
    status: json["status"],
    message: json["message"],
    rideId: json["rideId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "rideId": rideId,
  };
}
