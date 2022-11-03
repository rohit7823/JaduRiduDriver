import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_number_plate_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'number_plate_store.g.dart';

class NumberPlateStore = _BackSideWithNumberPlateStore with _$NumberPlateStore;

abstract class _BackSideWithNumberPlateStore with Store {
  final _repository = dependency<VehicleNumberPlateRepository>();
  final _storage = dependency<Storage>();

  @observable
  bool enableBtn = false;

  @observable
  File? selectedImage;

  @action
  onClose() {
    selectedImage = null;
  }

  @action
  validateInputs(Function(bool) callBack) async {
    while (true) {
      if (selectedImage == null) {
        callBack(false);
      } else {
        callBack(true);
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  onDone(
      {required Function(int, int) uploading,
      required Function(String) success,
      required Function(String) error,
      required Function(String) responseError}) async {
    var userId = _storage.userId();
    var response =
        await _repository.uploadNumberPlate(userId, selectedImage!, uploading);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isUploading) {
            success(data.message);
          } else {
            error(data.message);
          }
          break;
        default:
          responseError(data?.message ?? "");
      }
    } else if (response is Error) {
      responseError(response.message ?? "");
    }
  }
}
