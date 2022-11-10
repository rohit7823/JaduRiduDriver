
import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_partner_care_response.dart';
import 'package:jadu_ride_driver/core/repository/partner_care_repository.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';

import '../core/domain/response/partner_care_response.dart';
import '../data/online/partner_care_api.dart';

class PartnerCareRepositoryImpl implements PartnerCareRepository{
  final Dio _dio;
  late final PartnercareApi _partnerCareApi;

  PartnerCareRepositoryImpl(this._dio){
    _dio.options = ApiClientConfiguration.mainConfiguration;
        _partnerCareApi = PartnercareApi(_dio);
  }


  @override
  Future<Resource<PartnerCareResponse>> uploadPartnerCare(String userId, String userInputName,
      String userInputEmail, String userInputSubject, String userInputMsg) async {

    return _partnerCareApi.partnerCare(userId, userInputName, userInputEmail, userInputMsg, userInputSubject).handleResponse<PartnerCareResponse>();

       /*await Future.delayed(const Duration(seconds: 2));
       return Success(UploadPartnerCareResponse(
           status: true, message: "Success", isUploaded: true));*/
  }
}