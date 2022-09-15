
import 'package:dio/dio.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_partner_care_response.dart';
import 'package:jadu_ride_driver/core/repository/partner_care_repository.dart';

class PartnerCareRepositoryImpl implements PartnerCareRepository{
  /*final Dio _dio;
  late final PartnerCareApi _partnerCareApi;*/
  @override
  Future<Resource<UploadPartnerCareResponse>> uploadPartnerCare(String userInputName,
      String userInputEmail, String userInputSubject, String userInputMsg) async {
       await Future.delayed(const Duration(seconds: 2));
       return Success(UploadPartnerCareResponse(
           status: true, message: "Success", isUploaded: true));
  }

}