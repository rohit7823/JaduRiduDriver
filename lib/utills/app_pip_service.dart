import 'dart:async';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class AppPipService {
  static final FlutterBackgroundService instance = FlutterBackgroundService();
  static StreamSubscription? pipStatusSubscription;

  AppPipService._();

  static Future<dynamic> config() async {
    await instance.configure(
        iosConfiguration: IosConfiguration(
          autoStart: false,
        ),
        androidConfiguration: AndroidConfiguration(
            autoStart: false,
            onStart: _onServiceStart,
            isForegroundMode: true));

    await instance.startService();
  }

  @pragma('vm:entry-point')
  static Future<void> _onServiceStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    service.on("openPipMode").listen((event) async {
      debugPrint("openPipInvoked");
      //await pipMode.enable(const Rational.square());
    });
  }

  static dispose() {
    pipStatusSubscription?.cancel();
  }
}
