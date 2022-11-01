import 'dart:isolate';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/timestamp_with_direction.dart';
import 'package:jadu_ride_driver/core/service/app_lifecyle_utility_callbacks.dart';
import 'package:jadu_ride_driver/core/service/constants.dart';
import 'package:jadu_ride_driver/helpers_impls/app_location_service.dart';
import 'package:jadu_ride_driver/utills/directions.dart';

class DestinationTaskHandler extends TaskHandler {
  final Directions _directionsApi;
  SendPort? _sendPort;
  final AppLocationService _locationService;
  ScreenWithExtras screenToRedirect;

  DestinationTaskHandler(
      this._directionsApi, this._locationService, this.screenToRedirect);

  @override
  Future<void> onDestroy(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = null;
    await FlutterForegroundTask.clearAllData();
  }

  @override
  Future<void> onEvent(DateTime timestamp, SendPort? sendPort) async {
    var currentLocation = await _locationService.getCurrentLocation();
    var directionResponse = await _directionsApi
        .origin(LatLng(currentLocation.latitude, currentLocation.longitude))
        .destination(
            LatLng(currentLocation.latitude, currentLocation.longitude))
        .request();

    if (directionResponse != null) {
      FlutterForegroundTask.updateService(
        notificationTitle:
            "You've Reached - ${directionResponse.routes.first.summary}",
        notificationText: directionResponse.routes.first.legs.first.endAddress,
      );
      _sendPort?.send(TimeStampWithDirection(
          timpStamp: timestamp, directionResponse: directionResponse)
      );
    }
  }

  @override
  Future<void> onStart(DateTime timestamp, SendPort? sendPort) async {
    _sendPort = sendPort;
    var currentLocation = await _locationService.getCurrentLocation();
    var directionResponse = await _directionsApi
        .origin(LatLng(currentLocation.latitude, currentLocation.longitude))
        .destination(
            LatLng(currentLocation.latitude, currentLocation.longitude))
        .request();

    if (directionResponse != null) {
      FlutterForegroundTask.updateService(
        notificationTitle: "You're Currently on",
        notificationText: directionResponse.routes.first.legs.first.endAddress,
      );
    }
  }

  @override
  void onButtonPressed(String id) {
    if (id == Constants.backToApp) {
      AppLifeCycleUtilityCallbacks.bringToForeground(
          screenToRedirect.screen.name
      );
    }
  }

  @override
  void onNotificationPressed() {
    AppLifeCycleUtilityCallbacks.bringToForeground(
        screenToRedirect.screen.name);
    _sendPort?.send(screenToRedirect);
  }
}
