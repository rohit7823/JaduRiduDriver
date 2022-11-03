abstract class Storage {
  saveBaseUrl(String url);
  String baseUrl();

  introComplete(bool value);
  bool isIntroComplete();

  login(bool value);
  bool isLogin();

  saveUserId(String id);
  String userId();

  saveNumberCode(String code);
  String numberCode();

  saveUserName(String name);
  String name();

  setDriverStatus(String status);
  String driverStatus();

  setAccountStatus(String status);
  String accountStatus();
}
