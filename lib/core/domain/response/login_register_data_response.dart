import '../login_registration_data.dart';

class LoginRegisterDataResponse {
  bool status;
  String message;
  LoginRegistrationData data;

  LoginRegisterDataResponse(
      {required this.status, required this.message, required this.data});
}
