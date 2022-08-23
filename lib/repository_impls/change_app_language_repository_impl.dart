import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/app_language_update_response.dart';
import 'package:jadu_ride_driver/core/repository/change_app_language_repository.dart';

class ChangeAppLanguageRepositoryImpl implements ChangeAppLanguageRepository {
  @override
  Future<Resource<AppLanguageUpdateResponse>> updateLanguage(String userId, String langCode) async {
    await Future.delayed(const Duration(seconds: 2));

    return Success(AppLanguageUpdateResponse(
        status: true,
        message: "Success",
        isUpdated: true)
    );
  }

}