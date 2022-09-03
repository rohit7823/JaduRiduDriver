import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/chasis_number_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'chasis_number_screen_store.g.dart';

class ChasisNumberStore = _ChasisNumberScreenStore with _$ChasisNumberStore;

abstract class _ChasisNumberScreenStore with Store {
  final _repository = dependency<ChasisNumberRepository>();
  final _storage = dependency<Storage>();
  final _picker = ImageFilePicker();

  @observable
  String chasisNumber = "";

  @observable
  File? selectedImage;

  @observable
  bool enableBtn = false;

  @action
  onChasisNumber(String number) {
    chasisNumber = number;
  }

  @action
  onClose() {
    selectedImage = null;
  }

  @action
  validateInputs(Function(bool) callBack) async {
    while (true) {
      if (selectedImage == null) {
        callBack(false);
      } else if (chasisNumber.isEmpty) {
        callBack(false);
      } else {
        callBack(true);
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  onDone(
      {required Function(bool, int) uploading,
      required Function success,
      required Function(String) error,
      required Function(String) responseError}) async {
    var userId = _storage.userId();
    var response = await _repository.uploadChasisNumber(
        userId, chasisNumber, selectedImage!, uploading);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isUploaded) {
            /*selectedImage = null;
            chasisNumber = "";*/
            success();
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
