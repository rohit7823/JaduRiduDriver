import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';

class NumberCodesResponse {
  bool status;
  String message;
  List<MobileNumberCode> codes;

  NumberCodesResponse(
      {required this.status, required this.message, required this.codes});
}
