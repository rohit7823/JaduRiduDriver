import 'package:jadu_ride_driver/core/domain/expired_document_alert.dart';

class ExpiredDocumentAlertResponse {
  bool status;
  String message;
  ExpiredDocumentAlert documentAlert;

  ExpiredDocumentAlertResponse(
      {required this.status,
      required this.message,
      required this.documentAlert});
}
