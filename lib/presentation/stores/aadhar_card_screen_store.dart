import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/uploader_implementation.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/helpers/validator.dart';
import 'package:jadu_ride_driver/core/repository/aadhar_number_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../utills/extensions.dart';

part 'aadhar_card_screen_store.g.dart';

class AadharCardStore = _AadharCardScreenStore with _$AadharCardStore;

abstract class _AadharCardScreenStore extends AppNavigator with Store {
  final _repository = dependency<AadharNumberRepository>();
  final _storage = dependency<Storage>();
  final _validator = dependency<Validator>();
  final dialogManager = DialogManager();
  final uploader = Uploader(implementation: UploaderImplementation.real);
  final _picker = ImageFilePicker();

  _AadharCardScreenStore() {
    prefillData();
    _validateInputs();
  }

  @observable
  String aaharNumber = "";

  @observable
  File? selectedImage;

  @observable
  bool enableBtn = false;

  @observable
  String informMessage = "";

  @observable
  DialogState imagePicker = DialogState.notDisplaying;

  @observable
  String errorMessage = "";

  @observable
  bool prefillLoader = false;

  @action
  prefillData() async {
    prefillLoader = true;
    var response = await _repository.setData(_storage.userId());
    if (response.data != null) {
      debugPrint("response.data ${response.data}");
      response.data.forEach((key, value) async {
        if (key == "assets") {
          selectedImage = await urlToFile(value);
        } else if(key == "value") {
          aaharNumber = value;
        }
      });
    }
    prefillLoader = false;
  }

  @action
  _validateInputs() async {
    while (true) {
      if (aaharNumber.isEmpty) {
        enableBtn = false;
      } else if (selectedImage == null) {
        enableBtn = false;
      } else {
        if (_validator.isAadharValid(aaharNumber)) {
          errorMessage = "";
          enableBtn = true;
        } else {
          errorMessage = StringProvider.invalidAadhar;
          enableBtn = false;
        }
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadDriverAadhar) {
      onDone();
    }
  }

  @action
  openImagePicker() {
    imagePicker = DialogState.displaying;
  }

  @action
  closeImagePicker() {
    imagePicker = DialogState.notDisplaying;
  }

  @action
  fromGallery() async {
    selectedImage = await _picker.chooseFromGallery();
  }

  @action
  fromCamera() async {
    selectedImage = await _picker.clickViaCamera();
  }

  @action
  onClose() {
    selectedImage = null;
  }

  @action
  onAadharNumber(String number) {
    aaharNumber = number;
  }

  @action
  onDone() async {
    var userId = _storage.userId();
    var response = await _repository.uploadAadhar(
        userId, aaharNumber, selectedImage!, uploader.start);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isUploaded) {
            informMessage = data.message;
            onChange(
                ScreenWithExtras(screen: Screen.addAllDetails, argument: true));
          } else {
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.retry,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.none,
                    action: AlertAction.uploadDriverAadhar)));
          }
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.invokeOnBarrier,
                  action: AlertAction.uploadDriverAadhar)));
      }
    } else if (response is Error) {
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.invokeOnBarrier,
              action: AlertAction.uploadDriverAadhar)));
    }
  }
}
