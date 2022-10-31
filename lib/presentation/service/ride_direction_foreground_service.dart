import 'dart:io';
import 'dart:isolate';
import 'package:flutter/cupertino.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:jadu_ride_driver/core/service/event_notifier.dart';
import 'package:jadu_ride_driver/core/service/ride_direction_notification_service.dart';
import 'package:jadu_ride_driver/utills/app_overlay_settings.dart';

class RideDirectionForegroundService
    with AppOverlaySettings
    implements RideDirectionNotificationService, EventNotifier {
  ReceivePort? _eventPipeline;

  @override
  void init({String? channelID, String? channelName, String? description}) {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
          channelId: channelID ?? "jadu_ride_default_ride_notification_id",
          channelName: channelName ?? "Jadu Ride Direction Notification",
          channelDescription: description,
          channelImportance: NotificationChannelImportance.MAX,
          priority: NotificationPriority.MAX,
          buttons: [
            const NotificationButton(id: 'sendButton', text: 'Back to app'),
          ],
          iconData: const NotificationIconData(
            resType: ResourceType.mipmap,
            resPrefix: ResourcePrefix.ic,
            name: 'launcher',
          ),
          playSound: true),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: true,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        isOnceEvent: true,
        autoRunOnBoot: false,
        allowWakeLock: true,
        allowWifiLock: false,
      ),
    );
  }

  @override
  initPort(bool isGranted) async {
    closePort();

    if (isGranted) {
      _eventPipeline = await FlutterForegroundTask.receivePort;
      debugPrint("eventPipeLine $_eventPipeline");
    } else {
      _eventPipeline = null;
    }
  }

  @override
  ReceivePort? get eventPort => _eventPipeline;

  @override
  closePort() {
    _eventPipeline?.close();
    _eventPipeline = null;
  }

  @override
  stop() async {
    await FlutterForegroundTask.stopService();
  }
}
