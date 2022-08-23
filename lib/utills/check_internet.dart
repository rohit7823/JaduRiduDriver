import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'connectivity_state.dart';

typedef RecieveStateCallback = Function(ConnectivityState);

mixin CheckInternet {
  late StreamSubscription<ConnectivityResult>? _subscription;

  checkNow(RecieveStateCallback recieveStateCallback) {
    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      switch (event) {
        case ConnectivityResult.bluetooth:
          recieveStateCallback.call(ConnectivityState.Gained);
          break;
        case ConnectivityResult.ethernet:
          recieveStateCallback.call(ConnectivityState.Gained);
          break;
        case ConnectivityResult.wifi:
          recieveStateCallback.call(ConnectivityState.Gained);
          break;
        case ConnectivityResult.mobile:
          recieveStateCallback.call(ConnectivityState.Gained);
          break;
        default:
          recieveStateCallback.call(ConnectivityState.Gone);
      }
    });
  }

  disposeInternetSubscription() {
    _subscription?.cancel();
  }
}
