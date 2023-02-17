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

  @override
  String name() {
    return _pref.getString(Constants.userName) ?? "";
  }

  @override
  saveUserName(String name) {
    _pref.setString(Constants.userName, name);
  }

  @override
  String driverStatus() {
    return _pref.getString(Constants.driverStatus) ?? "";
  }

  @override
  removeDriverStatus() {
    _pref.remove(Constants.driverStatus);
  }

  @override
  setDriverStatus(String status) {
    _pref.setString(Constants.driverStatus, status);
  }

  @override
  String accountStatus() {
    return _pref.getString(Constants.accountStatus) ?? "";
  }

  @override
  setAccountStatus(String status) {
    _pref.setString(Constants.accountStatus, status);
  }

  @override
  bool disclosureStatus() {
    return _pref.getBool(Constants.disclosureStatus) ?? false;
  }

  @override
  locationDisclosureStatus(bool status) {
    _pref.setBool(Constants.disclosureStatus, status);
  }

  @override
  String? selectedGoToLocation() => _pref.getString(Constants.selectedGOTOLocation);

  @override
  setGoToLocation(String? location) {
    if(location != null) {
      _pref.setString(Constants.selectedGOTOLocation, location);
    }
  }


  @override
  Future<bool> removeSelectedGoToLocation() => _pref.remove(Constants.selectedGOTOLocation);
}
