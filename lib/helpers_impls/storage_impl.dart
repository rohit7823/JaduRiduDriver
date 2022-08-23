import 'package:jadu_ride_driver/core/common/constants.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageImpl implements Storage {
  final SharedPreferences _pref;
  StorageImpl(this._pref);

  @override
  String baseUrl() {
    return _pref.getString(Constants.baseUrl) ?? "";
  }

  @override
  saveBaseUrl(String url) {
    _pref.setString(Constants.baseUrl, url);
  }

  @override
  introComplete(bool value) {
    _pref.setBool(Constants.intro, value);
  }

  @override
  bool isIntroComplete() {
    return _pref.getBool(Constants.intro) ?? false;
  }

  @override
  bool isLogin() {
    return _pref.getBool(Constants.login) ?? false;
  }

  @override
  login(bool value) {
    _pref.setBool(Constants.login, value);
  }

  @override
  saveUserId(String id) {
    _pref.setString(Constants.userId, id);
  }

  @override
  String userId() {
    return _pref.getString(Constants.userId) ?? "";
  }

  @override
  String numberCode() {
    return _pref.getString(Constants.numberCode) ?? "";
  }

  @override
  saveNumberCode(String code) {
    _pref.setString(Constants.numberCode, code);
  }
}
