import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/batch_call_response.dart';
import 'package:jadu_ride_driver/core/domain/response/emergency_places_response.dart';
import 'package:jadu_ride_driver/core/domain/response/expired_document_alert_response.dart';

import '../domain/response/driver_account_status_response.dart';
import '../domain/response/fcm_token_response.dart';

abstract class BaseRepository {
  Future<Resource<BatchCallResponse>> getIntroPageData();

  Future<Resource<BatchCallResponse>> getLRPageData();

  Future<Resource<DriverAccountStatusResponse>> driverAccountStatus(
      String deviceID);

  Future<Resource<FcmTokenResponse>> sendTokenToServer(
      String userId, String token);

  Future<Resource<EmergencyPlacesResponse>> emergencyPlaces(
      LatLong currentLocation);

  Future<Resource<ExpiredDocumentAlertResponse>> giveAlert(String userId);
}
