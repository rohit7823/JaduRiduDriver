import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/left_side_exterior_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:mobx/mobx.dart';

import '../../utills/dialog_manager.dart';

part 'left_side_exterior_store.g.dart';

class LSExteriorStore = _LeftSideExteriorStore with _$LSExteriorStore;

abstract class _LeftSideExteriorStore with Store {
  final _repository = dependency<LeftSideExteriorRepository>();
  final _storage = dependency<Storage>();

  final uploader = Uploader();
  final dialogManager = DialogManager();

  @observable
  File? selectedImage;

  @observable
  bool enableBtn = false;

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
  onDone(
      {required Function(bool, int) uploading,
      required Function(String) success,
      required Function(String) error,
      required Function(String) responseError}) async {
    var userId = _storage.userId();
    var response = await _repository.uploadLeftSideExterior(
        userId, selectedImage!, uploading);

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
          responseError(data?.message ?? "");
      }
    } else if (response is Error) {
      responseError(response.message ?? "");
    }
  }
}
