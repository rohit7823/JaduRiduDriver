import 'dart:io';

import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:mobx/mobx.dart';

import '../../utills/dialog_manager.dart';

part 'right_side_exterior_store.g.dart';

class RSExteriorStore = _RightSideExteriorStore with _$RSExteriorStore;

abstract class _RightSideExteriorStore with Store {
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
  onDone() {}

  @action
  onClose() {
    selectedImage = null;
  }

  @action
  onUpload() {}
}
