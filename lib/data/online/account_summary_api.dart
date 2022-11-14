
import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/api_route.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_accounts_response.dart';
import 'package:retrofit/http.dart';


import 'package:dio/dio.dart';
part 'account_summary_api.g.dart';

@RestApi()
abstract class AccountSummaryApi {
  factory AccountSummaryApi(Dio dio, {String? baseUrl}) = _AccountSummaryApi;

  @GET("${ApiRoutes.parent}/users/{userId}/accountSummery")
  Future<AccountsSummeryResponse> accountSummary(@Path("userId") String userId);

}
