import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_details_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upi_validate_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upis_response.dart';
import 'package:jadu_ride_driver/core/domain/upi_id.dart';
import 'package:jadu_ride_driver/core/repository/payment_details_repository.dart';

class PaymentDetailsRepositoryImpl implements PaymentDetailsRepository {
  @override
  Future<Resource<PaymentDetailsResponse>> paymentDetails(
      String userId,
      String selectedMethod,
      File? QrCode,
      String upiId,
      Function(bool p1, int p2) onUploading) async {
    var size = await QrCode?.length();
    onUploading(true, size ?? 0);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(PaymentDetailsResponse(
        status: true, message: "Success", isSubmitted: true));
  }

  @override
  Future<Resource<UpisResponse>> getUpiIds() async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(UpisResponse(
        status: true,
        message: "Success",
        upis: List.generate(4,
            (index) => UpiID(id: "${index + 1}", name: "@UpiID${index + 1}"))));
  }

  @override
  Future<Resource<UpiValidateResponse>> validateUpi(String fullUpiId) async {
    await Future.delayed(const Duration(seconds: 1));
    var parts = fullUpiId.split("@");
    var isValid = false;
    if (parts.first == "rohit.manna9674" && parts.last == "UpiID2") {
      isValid = true;
    } else {
      isValid = false;
    }

    return Success(UpiValidateResponse(
        status: true, message: "Success", isValid: isValid));
  }
}
