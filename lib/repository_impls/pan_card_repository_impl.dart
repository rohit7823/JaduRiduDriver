import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_pan_card_response.dart';
import 'package:jadu_ride_driver/core/repository/pan_card_repository.dart';
import 'package:jadu_ride_driver/data/online/prefill_details_api.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../data/online/pan_card_api.dart';

class PanCardRepositoryImpl implements PanCardRepository {
  final Dio _dio;
  late final PanCardApi _panCardApi;
  late final PrefillDetailsApi _prefillDetailsApi;

  PanCardRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _panCardApi = PanCardApi(_dio);
    _prefillDetailsApi = PrefillDetailsApi(_dio);
  }

  @override
  Future<Resource<UploadPanCardResponse>> uploadPanCard(String userId,
      String number, File panCard, Function(int p1, int p2) onUploading) async {
    return await _panCardApi
        .driverPan(userId, number, panCard, onUploading)
        .handleResponse<UploadPanCardResponse>();

    /*var size = await panCard.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadPanCardResponse(
        status: true, message: "Success", isUploaded: true));*/
  }

  @override
  Future<MasterResponse> setData(String userId) =>
      _prefillDetailsApi.prefillDetails(userId, DetailsStepKey.panCard.key);
}
