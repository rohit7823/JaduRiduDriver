import 'package:jadu_ride_driver/core/domain/expired_document_alert.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class ExpiredDocumentAlertResponse extends BusinessObject{
  bool status;
  String message;
  ExpiredDocumentAlert documentAlert;

  ExpiredDocumentAlertResponse(
      {required this.status,
      required this.message,
      required this.documentAlert});

  factory ExpiredDocumentAlertResponse.fromJson(Map<String, dynamic> json) =>
      ExpiredDocumentAlertResponse(
          status: json["status"],
          message: json["message"],
          documentAlert: ExpiredDocumentAlert.fromJson(json["documentAlert"]));
}
