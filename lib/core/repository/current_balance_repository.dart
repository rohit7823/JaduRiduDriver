import '../common/response.dart';
import '../domain/response/upload_current_balance_response.dart';

abstract class CurrentBalanceRepository {
  Future<Resource<UploadCurrentBalanceResponse>> uploadCurrentBalanceResponse(String userId);
}