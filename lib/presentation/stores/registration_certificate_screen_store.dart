import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/registration_certificate_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/uploader_implementation.dart';
import '../../utills/extensions.dart';

part 'registration_certificate_screen_store.g.dart';

class RegistrationCertificateStore = _RegistrationCertificateScreenStore
    with _$RegistrationCertificateStore;

abstract class _RegistrationCertificateScreenStore extends AppNavigator
    with Store {
  final _repository = dependency<RegistrationCertificateRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();
  final uploader = Uploader(implementation: UploaderImplementation.real);
  final _picker = ImageFilePicker();

  @observable
  File? selectedImage;

  @observable
  bool enableBtn = false;

  @observable
  DialogState openImagePicker = DialogState.notDisplaying;

  @observable
  String informMessage = "";

  @observable
  bool prefillLoader = true;

  _RegistrationCertificateScreenStore() {
    prefillData();
    _validateInputs();
  }

  @action
  prefillData() async {
    prefillLoader = true;
    var response = await _repository.setData(_storage.userId());
    if (response.data != null) {
      response.data.forEach((key, value) async {
        if (key == "assets") {
          selectedImage = await urlToFile(value);
        }
      });
    }
    prefillLoader = false;
  }

  @action
  onOpenPickerClick() {
    openImagePicker = DialogState.displaying;
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
  clearSelectedImage() {
    selectedImage = null;
  }

  @action
  _validateInputs() async {
    while (true) {
      if (selectedImage == null) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  onDone() async {
    var userId = _storage.userId();
    var response = await _repository.uploadCertificate(
        userId, selectedImage!, uploader.start);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.status) {
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
                    action: AlertAction.uploadDriverRegistrationCertificate)));
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
                  option: AlertOption.none,
                  action: AlertAction.uploadDriverRegistrationCertificate)));
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
              action: AlertAction.uploadDriverRegistrationCertificate)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadDriverRegistrationCertificate) {
      onDone();
    }
  }
}
