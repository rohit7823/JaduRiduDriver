import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/repository/driver_live_location_repository.dart';
import 'package:jadu_ride_driver/data/online/driver_live_location_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';

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
}
