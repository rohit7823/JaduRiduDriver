import 'dart:io';

import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:mobx/mobx.dart';

import '../../utills/dialog_manager.dart';

part 'car_inside_store.g.dart';

class InsideCarStore = _CarInsideStore with _$InsideCarStore;

abstract class _CarInsideStore with Store {
  final uploader = Uploader();
  final dialogManager = DialogManager();

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
  onDone() {}

  @action
  onClose() {
    selectedImage = null;
  }

  @action
  onUpload() {}
}
