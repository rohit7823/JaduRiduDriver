import 'package:firebase_core/firebase_core.dart';

import 'package:jadu_ride_driver/core/common/app_constants.dart';
import 'package:jadu_ride_driver/firebase_options.dart';
import 'package:jadu_ride_driver/utills/global.dart';

class GoogleFirebase {
  GoogleFirebase._();
  static Future init() async {
    if (Global.getPlatform() == AppConstants.android) {
      var app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await app.setAutomaticDataCollectionEnabled(true);
    }
  }
}
