import 'package:jadu_ride_driver/core/domain/response/help_response.dart';

import '../common/response.dart';
import '../domain/response/required_data_help_repository.dart';
import '../domain/response/upload_data_response.dart';

abstract class HelpRepository {
  Future<Resource<RequiredDataHelpResponse>> getHelpInittialData(String userId);
  Future<Resource<HelpResponse>> uploadInqueryData(String userId, String userInputName, String userInputEmail, String userInputSubject, String userInputMsg);
}