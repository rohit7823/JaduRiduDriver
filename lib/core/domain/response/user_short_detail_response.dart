import 'package:jadu_ride_driver/core/domain/user_short_detail.dart';

class UserShortDetailResponse {
  bool status;
  String message;
  UserShortDetail detail;


  UserShortDetailResponse({required this.status, required this.message, required this.detail});
}