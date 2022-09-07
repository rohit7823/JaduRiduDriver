import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/add_all_details_initial_data_response.dart';
import 'package:retrofit/http.dart';

part 'add_all_details_api.g.dart';

@RestApi()
abstract class AddAllDetailsApi {
  factory AddAllDetailsApi(Dio dio, {String? baseUrl}) = _AddAllDetailsApi;

  @GET("${ApiRoutes.parent}/users/{userId}/document/addedDetails")
  Future<AddAllDetailsInitialDataResponse> initialData(
      @Path("userId") String userId);
}
