import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/master_response.dart';

import '../domain/response/upload_insurance_response.dart';

abstract class VehicleInsuranceRepository {

  Future<MasterResponse> setData(String userId);

  Future<Resource<UploadInsuranceResponse>> uploadInsurance(
      String userId,
      String number,
      String validTil,
      String validInsurance,
      File insurance,
      Function(int, int) onUploading);
}
