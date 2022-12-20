import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/api_methods.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/confirm_ride_response.dart';
import 'package:jadu_ride_driver/core/repository/emergency_place_repository.dart';
import 'package:jadu_ride_driver/data/online/confirm_booking_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';

import '../core/common/app_constants.dart';

class EmergencyPlaceRepositoryImpl implements EmergencyPlaceRepository {
  late final Map<String, String> _headers;
  final Dio _dio;
  late final ConfirmBookingApi _confirmBookingApi;

  EmergencyPlaceRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _headers = {
      AppConstants.xApiKey: _dio.options.headers[AppConstants.xApiKey],
      AppConstants.platform: _dio.options.headers[AppConstants.platform],
      AppConstants.deviceId: _dio.options.headers[AppConstants.deviceId]
    };
    _confirmBookingApi = ConfirmBookingApi(
        _headers, ApiClientConfiguration.mainConfiguration.baseUrl);
  }

  @override
  Future<Resource<ConfirmRideResponse>> initiateRide(
    LatLng from,
    LatLng to,
    List<LatLng> wayPoints,
    String service,
    String userId,
  ) async {
    debugPrint(
        "origin: ${from.latitude} ${from.longitude} destination: ${to.latitude} ${to.longitude}");
    return await _confirmBookingApi.confirmBooking(from, to, wayPoints, service,
        method: ApiMethods.post,
        driverId: userId,
        path: "$userId/emergency/initiateBooking");
  }
}
