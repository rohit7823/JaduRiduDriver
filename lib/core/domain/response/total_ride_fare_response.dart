class TotalRideFareResponse {
  String totalFare;
  String qrCode;
  TotalRideFareResponse({required this.totalFare, required this.qrCode});

  factory TotalRideFareResponse.fromJson(Map<String, dynamic> json) =>
      TotalRideFareResponse(
        totalFare: json["totalFare"],
        qrCode: json["qRCode"],
      );

  Map<String, dynamic> toJson() => {
        "totalFare": totalFare,
        "qRCode": qrCode,
      };
}
