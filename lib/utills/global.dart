import 'dart:io';

import 'package:jadu_ride_driver/core/helpers/storage.dart';

import '../core/common/app_constants.dart';
import '../modules/app_module.dart';

class Global {
  late final String? deviceId;

  Global(this.deviceId);

  static String getPlatform() {
    if (Platform.isAndroid) {
      return AppConstants.android;
    } else if (Platform.isIOS) {
      return AppConstants.ios;
    }
    return AppConstants.unknownPlatform;
  }

  static String get baseUrl {
    return dependency<Storage>().baseUrl();
  }
}
