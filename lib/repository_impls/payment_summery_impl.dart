
import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/payment_summery.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_summery_response.dart';
import 'package:jadu_ride_driver/core/repository/payment_summery_repository.dart';
import 'package:jadu_ride_driver/data/online/payment_summary_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class PaymentSummeryRepositoryImpl implements PaymentSummeryRepository {
  final Dio dio;
  late final PaymentSummaryApi _paymentSummaryApi;

  PaymentSummeryRepositoryImpl(this.dio){
    dio.options = ApiClientConfiguration.mainConfiguration;
    _paymentSummaryApi = PaymentSummaryApi(dio);
  }

  @override
  Future<Resource<GetPaymentSummeryResponse>> getPaymentSummeryResponse(String userInputId, String finalCurrentDate) async {



    return await _paymentSummaryApi
        .paymentsummary(userInputId,  finalCurrentDate)
        .handleResponse<GetPaymentSummeryResponse>();

    // await Future.delayed(const Duration(seconds: 1));
    // return Success(GetPaymentSummeryResponse(status: true, message: "Success", paymentSummeryList: List.generate(5, (index) => PaymentSummery(
    //     date: "Monday 18th June , 2022",
    //     paymentMethodType: "CASH",
    //     price: 500.0,
    //     customerName: "Ramesh Janha",
    //     bookingId: "DRE987654"))));
  }
}