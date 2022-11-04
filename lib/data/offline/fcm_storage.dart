import '../../objectbox.g.dart';
import '../../utills/object_box.dart';
import 'fcm_token.dart';
import 'notification.dart';

class FCMStorage {
  late final ObjectBox _objectBox;
  FCMStorage(this._objectBox);

  int saveNotification(AppNotification notification) {
    var box = _objectBox.store.box<AppNotification>();
    return box.put(notification, mode: PutMode.insert);
  }

  removeAllNotifications() {
    var box = _objectBox.store.box<AppNotification>();
    box.removeAll();
  }

  List<AppNotification> getAllNotification() {
    var box = _objectBox.store.box<AppNotification>();
    return box.getAll();
  }

  void saveFcmToken(String userId, String token) {
    var box = _objectBox.store.box<FcmToken>();
    box.put(FcmToken(id: 0, userId: userId, token: token),
        mode: PutMode.insert);
  }

  FcmToken? getLastToken() {
    var box = _objectBox.store.box<FcmToken>();
    var tokens = box.getAll();
    if (tokens.isNotEmpty) {
      return tokens.last;
    }
    return null;
  }

  void removePreviousToken() {
    var box = _objectBox.store.box<FcmToken>();
    box.removeAll();
  }
}
