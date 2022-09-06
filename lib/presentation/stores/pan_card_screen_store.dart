import 'dart:io';

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
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/helpers_impls/validator_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/helpers/validator.dart';
import '../../core/repository/pan_card_repository.dart';

part 'pan_card_screen_store.g.dart';

class PanCardStore = _PanCardScreenStore with _$PanCardStore;

abstract class _PanCardScreenStore extends AppNavigator with Store {
  final _repository = dependency<PanCardRepository>();
  final _storage = dependency<Storage>();
  final _imagePicker = ImageFilePicker();
  final _validator = dependency<Validator>();
  final uploader = Uploader(implementation: UploaderImplementation.real);
  final dialogManager = DialogManager();

  @observable
  String panNumber = "";

  @observable
  File? selectedImage;

  @observable
  bool enableBtn = false;

  @observable
  String errorMessage = "";

  @observable
  String informMessage = "";

  @observable
  DialogState openPickerDialog = DialogState.notDisplaying;

  _PanCardScreenStore() {
    _validateInputs();
  }

  @action
  _validateInputs() async {
    while (true) {
      if (panNumber.isEmpty) {
        enableBtn = false;
      } else if (selectedImage == null) {
        enableBtn = false;
      } else {
        if (_validator.isPanValid(panNumber)) {
          enableBtn = true;
          errorMessage = "";
        } else {
          enableBtn = false;
          errorMessage = StringProvider.invalidPan;
        }
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadPanCard) {
      onDone();
    }
  }

  @action
  onUpload() {
    openPickerDialog = DialogState.displaying;
  }

  @action
  fromGallery() async {
    selectedImage = await _imagePicker.chooseFromGallery();
  }

  @action
  formCamera() async {
    selectedImage = await _imagePicker.clickViaCamera();
  }

  @action
  clearSelected() {
    selectedImage = null;
  }

  @action
  onPanNumber(String value) {
    panNumber = value;
  }

  @action
  onDone() async {
    var userId = _storage.userId();
    var response = await _repository.uploadPanCard(
        userId, panNumber, selectedImage!, uploader.start);

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
                    action: AlertAction.uploadPanCard)));
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
                  action: AlertAction.uploadPanCard)));
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
              option: AlertOption.none, action: AlertAction.uploadPanCard)));
    }
  }
}
