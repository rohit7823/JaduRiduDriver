import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_details_response.dart';
import 'package:jadu_ride_driver/core/repository/payment_details_repository.dart';

class PaymentDetailsRepositoryImpl implements PaymentDetailsRepository {
  @override
  Future<Resource<PaymentDetailsResponse>> paymentDetails(
      String userId,
      String selectedMethod,
      File QrCode,
      String selectedUpiApp,
      String upiId,
      Function(bool p1, int p2) onUploading) async {
    var size = await QrCode.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(PaymentDetailsResponse(
        status: true, message: "Success", isSubmitted: false));
  }
}
