import 'package:jadu_ride_driver/core/helpers/validator.dart';

class ValidatorImpl implements Validator {
  static const _aadharPattern = "^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}\$";
  static const _panPattern = "[A-Z]{5}[0-9]{4}[A-Z]{1}";
  static const _emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool _isValid(String input, String pattern) {
    var regex = RegExp(pattern);
    return regex.hasMatch(input);
  }

  @override
  bool isAadharValid(String input) {
    return _isValid(input, _aadharPattern);
  }

  @override
  bool isPanValid(String input) {
    return _isValid(input, _panPattern);
  }

  @override
  bool isEmailValid(String input) {
    return _isValid(input, _emailPattern);
  }
}
