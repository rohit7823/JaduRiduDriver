import 'package:jadu_ride_driver/core/domain/app_version.dart';

class AppVersionResponse {
  bool status;
  String message;
  AppVersion version;

  AppVersionResponse(
      {required this.status, required this.message, required this.version});
}
