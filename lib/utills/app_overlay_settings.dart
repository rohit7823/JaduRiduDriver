import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:jadu_ride_driver/core/common/overlay_permission_status.dart';

import '../main.dart';

mixin AppOverlaySettings {
  Future<OverlayPermissionStatus> checkPermission() async {
    if (!await FlutterForegroundTask.canDrawOverlays) {
      final isGranted =
          await FlutterForegroundTask.openSystemAlertWindowSettings();
      if (!isGranted) {
        return OverlayPermissionStatus.notGranted;
      } else {
        return OverlayPermissionStatus.granted;
      }
    }
    return OverlayPermissionStatus.granted;
  }

  Future<bool> runOrRestartServiceIfNot() async {
    return await FlutterForegroundTask.startService(
        notificationTitle: "Ride Started",
        notificationText: "",
        callback: startCallback);
  }

  stopOverlay() async {}
}
