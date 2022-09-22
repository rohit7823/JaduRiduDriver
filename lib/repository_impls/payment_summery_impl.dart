
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/payment_summery.dart';
import 'package:jadu_ride_driver/core/domain/response/payment_summery_response.dart';
import 'package:jadu_ride_driver/core/repository/payment_summery_repository.dart';

class PaymentSummeryRepositoryImpl implements PaymentSummeryRepository {
  @override
  Future<Resource<GetPaymentSummeryResponse>> getPaymentSummeryResponse() async {
    await Future.delayed(const Duration(seconds: 1));
    return Success(GetPaymentSummeryResponse(status: true, message: "Success", paymentSummeryList: List.generate(5, (index) => PaymentSummery(
        date: "Monday 18th June , 2022",
        paymentMethodType: "CASH",
        price: 500.0,
        customerName: "Ramesh Janha",
        bookingId: "DRE987654"))));
  }
}