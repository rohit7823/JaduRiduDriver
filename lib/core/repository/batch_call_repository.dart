import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/batch_call_response.dart';

abstract class BatchCallRepository {
  Future<Resource<BatchCallResponse>> getIntroPageData();
  Future<Resource<BatchCallResponse>> getLRPageData();

  connectClientToSocket(String userId);
}
