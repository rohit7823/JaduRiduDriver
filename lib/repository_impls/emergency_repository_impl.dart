

import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_data_emergency_response.dart';

import '../core/repository/emergency_repository.dart';

class EmergencyRepositoryImpl extends EmergencyRepository{
  @override
  Future<Resource<RequiredDataEmergencyResponse>> getEmergencyInittialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));
    return Success(RequiredDataEmergencyResponse(status: true, message: "Success", emergencyPhoneNumber: "9876543210"));
  }
}