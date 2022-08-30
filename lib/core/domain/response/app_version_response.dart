import 'package:jadu_ride_driver/core/domain/app_version.dart';
import 'package:jadu_ride_driver/core/domain/response/business_object.dart';

class AppVersionResponse extends BusinessObject {
  bool status;
  String message;
  AppVersion version;

  AppVersionResponse(
      {required this.status, required this.message, required this.version});
}
