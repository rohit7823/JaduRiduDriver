import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/app_language_update_response.dart';

abstract class ChangeAppLanguageRepository {
  Future<Resource<AppLanguageUpdateResponse>> updateLanguage(String userId, String langCode);
}