import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_details_response.dart';

abstract class PaymentDetailsRepository {
  Future<Resource<PaymentDetailsResponse>> paymentDetails(
      String userId,
      String selectedMethod,
      File QrCode,
      String selectedUpiApp,
      String upiId,
      Function(bool, int) onUploading);
}
