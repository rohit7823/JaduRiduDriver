import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/app_language_update_response.dart';
import 'package:jadu_ride_driver/core/repository/change_app_language_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/change_language_api.dart';

class ChangeAppLanguageRepositoryImpl implements ChangeAppLanguageRepository {
  final Dio _dio;
  late final ChangeLanguageApi _changeLanguageApi;

  ChangeAppLanguageRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _changeLanguageApi = ChangeLanguageApi(_dio);
  }

  @override
  Future<Resource<AppLanguageUpdateResponse>> updateLanguage(
      String userId, String langCode) async {
    return await _changeLanguageApi
        .changeLang(langCode, userId)
        .handleResponse<AppLanguageUpdateResponse>();

    /*await Future.delayed(const Duration(seconds: 2));

    return Success(AppLanguageUpdateResponse(
        status: true, message: "Success", isUpdated: true));*/
  }
}
