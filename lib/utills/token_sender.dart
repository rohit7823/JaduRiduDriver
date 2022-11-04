import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:jadu_ride_driver/core/common/connectivity_state.dart';
import 'package:jadu_ride_driver/core/common/token_status.dart';
import 'package:jadu_ride_driver/core/repository/base_repository.dart';
import 'package:jadu_ride_driver/data/offline/fcm_storage.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:rxdart/subjects.dart';

import '../../core/common/alert_data.dart';
import '../../core/common/response.dart';
import '../core/common/app_constants.dart';
import '../core/repository/firebase_token.dart';
import 'check_internet.dart';

class TokenSender with CheckInternet implements FirebaseToken {
  late final BehaviorSubject<Map<String, dynamic>> notifyNewToken;
  late final StreamSubscription newTokenSubscription;
  final BaseRepository repository;
  final FCMStorage storage;

  TokenSender({required this.repository, required this.storage}) {
    notifyNewToken = BehaviorSubject<Map<String, dynamic>>();

    newTokenSubscription = notifyNewToken.listen((value) {
      var userId = value[AppConstants.userID];
      var token = value[AppConstants.fcmToken];
      sendToServer(userId, token).forEach((element) {
        debugPrint(element.toString());
      });
    });

    checkNow((connectivityState) {
      if (connectivityState == ConnectivityState.Gained) {
        debugPrint("connection restored");
        var token = storage.getLastToken();
        if (token != null &&
            token.userId.isNotEmpty &&
            token.token.isNotEmpty) {
          sendToServer(token.userId, token.token)
              .forEach((element) => debugPrint("sendTokenStatus $element"));
        }
      }
    });
  }

  @override
  Stream<dynamic> sendToServer(String userId, String token) async* {
    yield true;
    var status = await check();
    if (status == ConnectivityResult.none) {
      debugPrint("saving fcm token");
      storage.saveFcmToken(userId, token);
      yield false;
    } else {
      var response = await repository.sendTokenToServer(userId, token);
      if (response is Success) {
        var data = response.data;
        yield false;
        switch (data != null && data.status) {
          case true:
            if (data!.tokenUpdated) {
              debugPrint("fcm token updated!");
              storage.removePreviousToken();
              yield TokenStatus.updated;
            } else {
              yield TokenStatus.failed;
            }
            break;
          default:
            yield AlertData(StringProvider.error, null, StringProvider.appId,
                data!.message, StringProvider.retry, null, null, null);
            break;
        }
      } else if (response is Error) {
        yield false;
        yield AlertData(StringProvider.error, null, StringProvider.appId,
            response.message ?? "", StringProvider.retry, null, null, null);
      }
    }
  }

  dispose() {
    notifyNewToken.close();
    newTokenSubscription.cancel();
    disposeInternetSubscription();
  }
}
