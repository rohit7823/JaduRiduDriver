import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/common/app_language_codes.dart';

class CurrentLocale {
  final BuildContext _context;

  CurrentLocale(this._context);

  AppLanguageCode getLocaleCode() {
    AppLanguageCode code = AppLanguageCode.english;

    for (var element in AppLanguageCode.values) {
      if(_context.locale.toLanguageTag().contains("-") && element.value == _context.deviceLocale.toLanguageTag().split("-").first) {
        code = element;
      } else if(element.value == _context.locale.toLanguageTag()) {
        code = element;
      }
    }

    debugPrint("current locale: ${code}");
    return code;
  }

}