import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/domain/response/total_ride_fare_response.dart';
import 'package:jadu_ride_driver/core/domain/ride_location_response.dart';
import 'package:jadu_ride_driver/core/repository/driver_live_location_repository.dart';
import 'package:jadu_ride_driver/data/online/driver_live_location_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';

import '../core/common/socket_events.dart';
import '../utills/socket_io.dart';

class DriverLiveLocationRepositoryImpl implements DriverLiveLocationRepository {
  Dio _dio;
  late final DriverLiveLocationApi _liveLocationApi;

  DriverLiveLocationRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _liveLocationApi = DriverLiveLocationApi(_dio);
  }

  @override
  Future throwLiveLocation(String driverId, LatLng currentLocation) async {
    await _liveLocationApi.sendLiveLocation(driverId,
        LatLong(lat: currentLocation.latitude, lng: currentLocation.longitude));
  }

  @override
  StreamController<RideLocationResponse> onRideStarted() {
    StreamController<RideLocationResponse> controller = StreamController();

    SocketIO.client.on(SocketEvents.dropNavigation.value, (data) {
      debugPrint("dropNavigation ${RideLocationResponse.fromJson(data)}");
      controller.add(RideLocationResponse.fromJson(data));
    });

    return controller;
  }

  @override
  StreamController<TotalRideFareResponse> onRideFare() {
    var controller = StreamController<TotalRideFareResponse>();
    SocketIO.client.on(SocketEvents.totalRideFare.value, (data) {
      controller.add(TotalRideFareResponse.fromJson(data));
    });

    return controller;
  }
}
