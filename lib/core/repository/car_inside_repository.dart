import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';

import '../domain/response/upload_inside_car_response.dart';

abstract class CarInsideRepository {
  Future<Resource<UploadInsideCarResponse>> uploadInsideCar(
      String userId, File carInside, Function(bool, int) uploading);
}
