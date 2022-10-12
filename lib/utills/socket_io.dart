import 'dart:convert';

import 'package:flutter/widgets.dart';

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

  static init({bool autoConnect = false}) {
    _socketClient = soc.io("http://13.229.199.71:3000", <String, dynamic>{
      'autoConnect': false,
      'reconnection': true,
      'reconnectionDelay': 100,
      'reconnectionAttempts': 10,
      'transports': ['websocket'],
    });
    if (autoConnect) {
      connect();
    }
  }

  static connect() {
    _socketClient.connect().onConnect((_) {});
    _socketClient.on(SocketEvents.connectionStatus.value, (data) {
      debugPrint("socket_status $data");
      var response =
          SocketConnectionModel.fromJson(data as Map<String, dynamic>);
      debugPrint("socket_status ${response.status}");
      if (response.status == SocketStatus.connected.value) {
        latestStatus.value = SocketStatus.connected;
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
}
