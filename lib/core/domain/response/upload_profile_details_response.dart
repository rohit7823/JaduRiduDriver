
import 'business_object.dart';

class UploadProfileDetailsResponse extends BusinessObject {
  UploadProfileDetailsResponse({required this.status, required this.message, required this.isSaved});
  bool status;
  String message;
  bool isSaved;

  factory UploadProfileDetailsResponse.fromJson(Map<String, dynamic> json) =>
      UploadProfileDetailsResponse(
        status: json["status"],
        message: json["message"],
        isSaved: json["isSubmitted"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "isSubmitted": isSaved,
  };
}