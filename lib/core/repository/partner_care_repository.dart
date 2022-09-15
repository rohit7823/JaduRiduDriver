import 'package:jadu_ride_driver/core/common/response.dart';

import '../domain/response/upload_partner_care_response.dart';
abstract class PartnerCareRepository {
  Future<Resource<UploadPartnerCareResponse>> uploadPartnerCare(String userInputName, String userInputEmail, String userInputSubject, String userInputMsg);
}