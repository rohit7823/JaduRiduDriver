import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/common/app_constants.dart';
import 'package:rxdart/subjects.dart';
import 'package:socket_io_client/socket_io_client.dart' as soc;
import '../core/common/socket_events.dart';
import '../core/common/socket_status.dart';
import '../core/domain/socket_connection_model.dart';

class SocketIO {
  static late final soc.Socket _socketClient;
  static soc.Socket get client => _socketClient;

  static final BehaviorSubject<SocketStatus> latestStatus =
      BehaviorSubject<SocketStatus>.seeded(SocketStatus.neutral);

  SocketIO._();

  static init({bool autoConnect = false, required String userId}) {
    _socketClient = soc.io("http://13.250.30.215:3000", <String, dynamic>{
      'autoConnect': autoConnect,
      'transports': ['websocket'],
    });
    connect(userId, autoConnect);
  }

  static connect(String userId, bool autoConnect) {
    if (!autoConnect) {
      _socketClient.connect();
    }
    _socketClient.onConnect((data) =>
        debugPrint("connection established!! ID: ${_socketClient.id}"));
    _socketClient.on(SocketEvents.connectionStatus.value, (data) {
      debugPrint("socket_status $data");
      var response =
          SocketConnectionModel.fromJson(data as Map<String, dynamic>);
      debugPrint("socket_status ${response.status}");
      if (response.status == SocketStatus.connected.value) {
        latestStatus.value = SocketStatus.connected;
        _connectToClient(userId);
      } else {
        latestStatus.value = SocketStatus.disconnected;
      }
    });
  }

  static dispose() {
    _socketClient.disconnect();
    _socketClient.dispose();
    latestStatus.close();
  }

  static void _connectToClient(String userId) {
    SocketIO.client.emit(SocketEvents.afterConnection.value,
        {"id": userId, "type": AppConstants.socketKey});
  }
}
