import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/app_constants.dart';
import 'package:jadu_ride_driver/firebase_options.dart';
import 'package:jadu_ride_driver/utills/global.dart';

class GoogleFirebase {
  GoogleFirebase._();
  static Future init() async {
    if (Global.getPlatform() == AppConstants.android) {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    }
  }
}
