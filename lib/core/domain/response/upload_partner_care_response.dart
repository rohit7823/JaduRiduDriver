
class UploadPartnerCareResponse {
  UploadPartnerCareResponse(
      {required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadPartnerCareResponse.fromJson(Map<String, dynamic> json) =>
      UploadPartnerCareResponse(
        status: json["status"],
        message: json["message"],
        isUploaded: json["isSubmitted"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isSubmitted": isUploaded,
  };
}