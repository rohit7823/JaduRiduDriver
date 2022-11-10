import 'package:jadu_ride_driver/core/common/response.dart';

import '../domain/response/partner_care_response.dart';
import '../domain/response/upload_partner_care_response.dart';
abstract class PartnerCareRepository {
  Future<Resource<PartnerCareResponse>> uploadPartnerCare(String userId,String userInputName, String userInputEmail, String userInputSubject, String userInputMsg);
}