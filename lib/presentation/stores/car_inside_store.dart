import 'dart:io';

import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/car_inside_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:mobx/mobx.dart';

import '../../utills/dialog_manager.dart';

part 'car_inside_store.g.dart';

class InsideCarStore = _CarInsideStore with _$InsideCarStore;

abstract class _CarInsideStore with Store {
  final _repository = dependency<CarInsideRepository>();
  final _storage = dependency<Storage>();

  @observable
  bool enableBtn = false;

  @observable
  File? selectedImage;

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
  onClose() {
    selectedImage = null;
  }

  @action
  onDone({
    required Function(bool, int) uploading,
    required Function(String) success,
    required Function(String) error,
    required Function(String) responseError,
  }) async {
    var userId = _storage.userId();
    var response =
        await _repository.uploadInsideCar(userId, selectedImage!, uploading);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isUploaded) {
            success(data.message);
          } else {
            error(data.message);
          }
          break;
        default:
          error(data?.message ?? "");
      }
    } else if (response is Error) {
      responseError(response.message ?? "");
    }
  }
}
