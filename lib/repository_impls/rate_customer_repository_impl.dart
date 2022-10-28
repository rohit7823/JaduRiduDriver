import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/submit_review_response.dart';
import 'package:jadu_ride_driver/core/repository/rate_customer_repository.dart';
import 'package:jadu_ride_driver/data/online/customer_review_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

class RateCustomerRepositoryImpl extends RateCustomerRepository {
  final Dio _dio;
  late final CustomerReviewApi _customerReviewApi;

  RateCustomerRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _customerReviewApi = CustomerReviewApi(_dio);
  }

  @override
  Future<Resource<SubmitReviewResponse>> submitReview(
      String rideID, double customerRating, String customerReview) async {
    return _customerReviewApi
        .submitReview(rideID, customerRating, customerReview)
        .handleResponse<SubmitReviewResponse>();

    /*await Future.delayed(const Duration(seconds:  2));

    return Success(SubmitReviewResponse(
        status: true,
        message: "Success",
        isSubmitted: true
    ));*/
  }
}
