import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_pan_card_response.dart';
import 'package:jadu_ride_driver/core/repository/pan_card_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';

import '../data/online/pan_card_api.dart';

class PanCardRepositoryImpl implements PanCardRepository {
  final Dio _dio;
  late final PanCardApi _panCardApi;
  PanCardRepositoryImpl(this._dio) {
    _dio.options = ApiClientConfiguration.mainConfiguration;
    _panCardApi = PanCardApi(_dio);
  }

  @override
  Future<Resource<UploadPanCardResponse>> uploadPanCard(
      String userId,
      String number,
      File panCard,
      Function(bool p1, int p2) onUploading) async {
    var size = await panCard.length();
    onUploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    onUploading(false, 0);
    return Success(UploadPanCardResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
