import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rxdart/subjects.dart';

abstract class PushNotification {
  static final BehaviorSubject<RemoteMessage> backgroundMessage =
      BehaviorSubject<RemoteMessage>();

  Future init();
  String? getFirstToken();
  Future getUniqueToken({required Function onToken, Function? onTokenError});
  Future onMessageReceived(
      {required Function onMessage,
      required Function onBackgroundMessage,
      Function? onMessageError});

  Future<void> dispose();
}
