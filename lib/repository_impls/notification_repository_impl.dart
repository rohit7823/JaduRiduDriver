import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/about_notification_response.dart';
import 'package:jadu_ride_driver/core/domain/response/amount_transferred_response.dart';
import 'package:jadu_ride_driver/core/domain/response/getNotifiicationResponse.dart';
import 'package:jadu_ride_driver/core/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  @override
  Future<Resource<GetNotificationResponse>>getNotificationSummery(String userInputId) async {
//GetAmountTransferredResponse
    await Future.delayed(const Duration(seconds: 2));
    return Success(GetNotificationResponse(
        status: true, message: "Success",
        notificationlist: List.generate(5, (index) => NotificationResponseClass(time: "04:35", info: "Your bookings has been completed", image: "assets/images/tick.png"))));
  }

}