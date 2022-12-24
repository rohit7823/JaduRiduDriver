import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import '../../core/helpers/push_notification.dart';
import '../core/common/app_constants.dart';

class FirebaseNotification implements PushNotification {
  late StreamSubscription? tokenSubscription;
  late StreamSubscription? messageSubscription;
  late StreamSubscription? backgroundMessageSubscription;
  late FirebaseMessaging messaging;
  late NotificationSettings notificationSettings;
  String? token;
  FirebaseNotification(this.messaging);

  @override
  Future init() async {
    messaging.setAutoInitEnabled(true);
    token = await messaging.getToken();
    notificationSettings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  @override
  Future getUniqueToken(
      {required Function onToken, Function? onTokenError}) async {
    tokenSubscription = messaging.onTokenRefresh.listen((event) {
      onToken(event);
    });
    tokenSubscription?.onError((err) => onTokenError?.call(err));
  }

  @override
  Future onMessageReceived(
      {required Function onMessage,
      required Function onBackgroundMessage,
      Function? onMessageError}) async {
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      messageSubscription = FirebaseMessaging.onMessage.listen((event) {
        debugPrint(
            "ActionData: ${event.data[AppConstants.notificationActionKey]}");

        onMessage(event);
      });

      backgroundMessageSubscription =
          PushNotification.backgroundMessage.listen((value) {
        onBackgroundMessage(value);
      });
      messageSubscription?.onError((err) => onMessageError?.call(err));
    }
  }

  @override
  String? getFirstToken() {
    return token;
  }

  @override
  Future<void> dispose() async {
    tokenSubscription?.cancel();
    backgroundMessageSubscription?.cancel();
    messageSubscription?.cancel();
  }
}
