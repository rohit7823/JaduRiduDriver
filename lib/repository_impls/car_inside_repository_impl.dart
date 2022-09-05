import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/upload_inside_car_response.dart';
import 'package:jadu_ride_driver/core/repository/car_inside_repository.dart';

class CarInsideRepositoryImpl implements CarInsideRepository {
  @override
  Future<Resource<UploadInsideCarResponse>> uploadInsideCar(String userId,
      File carInside, Function(bool p1, int p2) uploading) async {
    var size = await carInside.length();
    uploading(true, size);
    await Future.delayed(const Duration(seconds: 3));
    uploading(false, 0);
    return Success(UploadInsideCarResponse(
        status: true, message: "Success", isUploaded: true));
  }
}
