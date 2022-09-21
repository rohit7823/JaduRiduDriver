import '../common/response.dart';
import '../domain/response/all_dates_response.dart';
import '../domain/response/get_current_balance_response.dart';

abstract class CurrentBalanceRepository {
  Future<Resource<AllDatesListsResponse>> allDatesResponse(String userId);
  Future<Resource<GetCurrentBalanceResponse>> uploadCurrentBalanceResponse(String userId, String id);
}