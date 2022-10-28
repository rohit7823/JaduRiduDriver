import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/submit_review_response.dart';
import 'package:retrofit/retrofit.dart';

part 'customer_review_api.g.dart';

@RestApi()
abstract class CustomerReviewApi {
  factory CustomerReviewApi(Dio dio, {String baseUrl}) = _CustomerReviewApi;

  @POST("${ApiRoutes.parent}/ride/{rideId}/customerReview")
  @FormUrlEncoded()
  Future<SubmitReviewResponse> submitReview(
      @Path("rideId") String rideId,
      @Field("rating") double customerRating,
      @Field("review") String customerReview);
}
