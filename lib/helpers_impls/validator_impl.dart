import 'package:jadu_ride_driver/core/helpers/validator.dart';

class ValidatorImpl implements Validator {
  static const _aadharPattern = "^[2-9]{1}[0-9]{3}\\s[0-9]{4}\\s[0-9]{4}\$";

  bool _isValid(String input, String pattern) {
    var regex = RegExp(pattern);
    return regex.hasMatch(input);
  }

  @override
  bool isAadharValid(String input) {
    return _isValid(input, _aadharPattern);
  }
}
