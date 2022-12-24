import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/utills/environment.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../../core/common/api_methods.dart';
import '../../core/common/api_route.dart';
import '../../core/common/response.dart';
import '../../core/domain/location_request.dart';
import '../../core/domain/response/confirm_ride_response.dart';
import '../../utills/directions.dart';

class ConfirmBookingApi {
  final Map<String, String> _headers;
  final String _baseUrl;

  ConfirmBookingApi(this._headers, this._baseUrl);

  Future<Resource<ConfirmRideResponse>> confirmBooking(
      LatLng from, LatLng to, List<LatLng> wayPoints, String service,
      {String? driverId,
      required ApiMethods method,
      required String path}) async {
    DirectionResponse? directionRes =
        await Directions(dependency<Environment>().googleApiKey)
            .origin(from)
            .destination(to)
            .addWaypoints(wayPoints)
            .request();
    debugPrint(
        "INITIATE BOOK REQUEST ${Uri.parse('$_baseUrl${ApiRoutes.parent}/$path')}");
    var request = http.Request(
      method.value,
      Uri.parse('$_baseUrl${ApiRoutes.parent}/$path'),
    );

    request.body = json.encode({
      "serviceId": service,
      "distance": directionRes?.distance,
      "duration": directionRes?.duration,
      "locations":
          LocationRequest(origin: from, destination: to, waypoints: wayPoints)
              .toJson(),
      "locationsText": directionRes?.routes.first.legs.toJson(),
      "driverId": driverId ?? ""
    });
    debugPrint("body ${request.body}");
    request.headers.addAll(_headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      debugPrint("initiate booking $data");
      return Success(ConfirmRideResponse.fromJson(jsonDecode(data)));
    } else {
      debugPrint("initiate booking ${await response.stream.bytesToString()}");
      return Error(message: response.reasonPhrase);
    }
  }
}
