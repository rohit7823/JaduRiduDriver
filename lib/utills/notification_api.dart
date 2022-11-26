import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';

import '../../core/common/app_constants.dart';

class NotificationApi {
  NotificationApi._();

  static final _notification = FlutterLocalNotificationsPlugin();
  static final BehaviorSubject<String?> behaviorSubjects = BehaviorSubject();

  static Future<NotificationDetails> _getNotificationDetails(
      {String? imageUrl,
      String? iconUrl,
      required String title,
      required String summary,
      String largeIcon = "largeIcon",
      String bigPicture = "bigPicture"}) async {
    var largeIconPath = await _downloadAndSaveFile(iconUrl, largeIcon);
    var bigPicturePath = await _downloadAndSaveFile(imageUrl, bigPicture);

    return NotificationDetails(
        android: AndroidNotificationDetails(
      AppConstants.notificationChannelId,
      AppConstants.notificationChannelName,
      importance: Importance.max,
      priority: Priority.max,
      autoCancel: true,
      visibility: NotificationVisibility.public,
      largeIcon:
          largeIconPath != null ? FilePathAndroidBitmap(largeIconPath) : null,
      styleInformation: bigPicturePath != null
          ? BigPictureStyleInformation(FilePathAndroidBitmap(bigPicturePath),
              contentTitle: title,
              htmlFormatContentTitle: true,
              summaryText: summary,
              htmlFormatSummaryText: true)
          : BigPictureStyleInformation(FilePathAndroidBitmap(largeIcon),
              summaryText: summary, contentTitle: title),
    ));
  }

  static showNotification(int id, String title, String body,
      {required String image,
      required String icon,
      required String payload}) async {
    var details = await _getNotificationDetails(
      iconUrl: icon.isNotEmpty ? icon : null,
      imageUrl: image.isNotEmpty ? image : null,
      summary: body,
      title: title,
    );
    await _notification.show(id, title, body, details, payload: payload);
  }

  static initNotification({required String appIcon}) async {
    await _notification.initialize(
        InitializationSettings(android: AndroidInitializationSettings(appIcon)),
        onSelectNotification: (payload) {
      debugPrint("NotificationPayload: $payload");
      behaviorSubjects.add(payload);
    });
  }

  static Future<String?> _downloadAndSaveFile(
      String? imageUrl, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    if (imageUrl != null) {
      final http.Response response = await http.get(Uri.parse(imageUrl));
      final File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    }
    return null;
  }
}
