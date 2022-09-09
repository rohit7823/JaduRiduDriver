import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_details_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upi_validate_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upis_response.dart';
import 'package:jadu_ride_driver/core/domain/upi_id.dart';
import 'package:jadu_ride_driver/core/repository/payment_details_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/payment_details_api.dart';

class PaymentDetailsRepositoryImpl implements PaymentDetailsRepository {
  final Dio _dio;
  late final PaymentDetailsApi _paymentDetailsApi;

  PaymentDetailsRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _paymentDetailsApi = PaymentDetailsApi(_dio);
  }

  @override
  Future<Resource<PaymentDetailsResponse>> paymentDetails(String userId,
      File QrCode, String upiId, Function(int p1, int p2) onUploading) async {
    return await _paymentDetailsApi
        .paymentDetails(userId, upiId, QrCode, onUploading)
        .handleResponse<PaymentDetailsResponse>();

    /*var size = await QrCode?.length();
    onUploading(true, size ?? 0);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(PaymentDetailsResponse(
        status: true, message: "Success", isSubmitted: true));*/
  }

  @override
  Future<Resource<UpisResponse>> getUpiIds() async {
    return await _paymentDetailsApi.upiHandles().handleResponse<UpisResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(UpisResponse(
        status: true,
        message: "Success",
        upis: List.generate(4,
            (index) => UpiID(id: "${index + 1}", name: "@UpiID${index + 1}"))));*/
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
