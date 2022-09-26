
import '../profile_short_response.dart';

class ProfileResponse {
  bool status;
  String message;
  DriverShortProfile driverShortProfile;

  ProfileResponse({required this.status, required this.message, required this.driverShortProfile});
}