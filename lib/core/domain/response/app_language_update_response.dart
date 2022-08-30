import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class AppLanguageUpdateResponse extends BusinessObject {
  bool status;
  String message;
  bool isUpdated;

  AppLanguageUpdateResponse(
      {required this.status, required this.message, required this.isUpdated});
}
