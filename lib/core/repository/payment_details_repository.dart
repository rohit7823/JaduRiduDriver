import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_details_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upi_validate_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upis_response.dart';

abstract class PaymentDetailsRepository {
  Future<Resource<PaymentDetailsResponse>> paymentDetails(
      String userId,
      String selectedMethod,
      File? QrCode,
      String upiId,
      Function(bool, int) onUploading);

  Future<Resource<UpisResponse>> getUpiIds();

  Future<Resource<UpiValidateResponse>> validateUpi(String fullUpiId);
}
