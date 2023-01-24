import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/about_notification_response.dart';
import 'package:jadu_ride_driver/core/domain/response/amount_transferred_response.dart';
import 'package:jadu_ride_driver/core/domain/response/getNotifiicationResponse.dart';
import 'package:jadu_ride_driver/core/repository/notification_repository.dart';
import 'package:jadu_ride_driver/data/online/notifications_api.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../utills/api_client_configuration.dart';

class NotificationRepositoryImpl implements NotificationRepository {


  final Dio _dio;
  late final NotificationsApi _notificationsApi;
  NotificationRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _notificationsApi = NotificationsApi(_dio);
  }



  @override
  Future<Resource<GetNotificationResponse>>getNotificationSummery(String userInputId) async {
    return _notificationsApi.api(userInputId).handleResponse<GetNotificationResponse>();

//GetAmountTransferredResponse
    /*await Future.delayed(const Duration(seconds: 2));
    return Success(GetNotificationResponse(
        status: true, message: "Success",
        notificationlist: List.generate(4, (index) => NotificationResponseClass(
            time: "04:35", info: "Your bookings has been completed", imagepath: "assets/images/tick.png"))));*/
  }

}