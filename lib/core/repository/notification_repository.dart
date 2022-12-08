

import 'package:jadu_ride_driver/core/domain/response/getNotifiicationResponse.dart';

import '../common/response.dart';
import '../domain/response/upload_accounts_response.dart';

abstract class NotificationRepository {
  Future<Resource<GetNotificationResponse>> getNotificationSummery(String userId);
}