import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/submit_review_response.dart';

abstract class RateCustomerRepository {
  Future<Resource<SubmitReviewResponse>> submitReview(
      String rideID, double customerRating, String customerReview);
}
