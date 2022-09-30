

import 'business_object.dart';

class UploadHelpInqueryResponse extends BusinessObject{

  UploadHelpInqueryResponse({required this.status, required this.message, required this.isUploaded});

  bool status;
  String message;
  bool isUploaded;

  factory UploadHelpInqueryResponse.fromJson(Map<String, dynamic> json) =>
  UploadHelpInqueryResponse(
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