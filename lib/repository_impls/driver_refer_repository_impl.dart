
import 'package:jadu_ride_driver/core/common/response.dart';

import 'package:jadu_ride_driver/core/domain/response/required_data_driver_refer_response.dart';

import '../core/domain/driver_refer.dart';
import '../core/repository/driver_refer_repository.dart';

class DriverReferRepositoryImpl extends DriverReferRepository{
  @override
  Future<Resource<RequiredDataDriverReferResponse>> getDriverReferInittialData(String userId) async {
    await Future.delayed(const Duration(seconds: 2));//RequiredDataDriverReferResponse
    return Success(RequiredDataDriverReferResponse(status: true, message: "Success",
        driverRefers: DriverRefer(driverToCustomar: 50, driverToDriver: 80, driverToCustomarReferCode: "SEGFERFYUF", driverToDriverReferCode: "ABCDEFGHIJ")));
  }

}