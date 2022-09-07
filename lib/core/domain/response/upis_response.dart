import 'package:jadu_ride_driver/core/domain/upi_id.dart';

class UpisResponse {
  bool status;
  String message;
  List<UpiID> upis;

  UpisResponse(
      {required this.status, required this.message, required this.upis});
}
