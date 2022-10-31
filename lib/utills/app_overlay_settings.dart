import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
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
    await FlutterOverlayWindow.showOverlay(
      width: 200,
      height: 200,
      alignment: OverlayAlignment.centerLeft,
    );
    return await FlutterForegroundTask.startService(
        notificationTitle: "Ride Started",
        notificationText: "",
        callback: startCallback);
  }

  stopOverlay() async {
    await FlutterOverlayWindow.shareData("close");
  }
}
