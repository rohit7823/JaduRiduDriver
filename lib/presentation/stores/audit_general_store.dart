import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/presentation/stores/car_inside_store.dart';
import 'package:jadu_ride_driver/presentation/stores/chasis_number_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/left_side_exterior_store.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/right_side_exterior_store.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/uploader_implementation.dart';
import 'number_plate_store.dart';

part 'audit_general_store.g.dart';

class AuditGeneralStore = _AuditGeneralStore with _$AuditGeneralStore;

abstract class _AuditGeneralStore extends AppNavigator with Store {
  final dialogManager = DialogManager();
  final _picker = ImageFilePicker();
  final uploader = Uploader(implementation: UploaderImplementation.real);

  @observable
  File? selectedImage;

  @observable
  String chasisNumber = "";

  Store requiredStore;

  @observable
  bool enableBtn = false;

  _AuditGeneralStore(this.requiredStore) {
    init();
    _validateInputs();
  }

  @action
  init() {
    if (requiredStore is ChasisNumberStore) {
      chasisNumber = (requiredStore as ChasisNumberStore).chasisNumber;
      selectedImage = (requiredStore as ChasisNumberStore).selectedImage;
    } else if (requiredStore is NumberPlateStore) {
      selectedImage = (requiredStore as NumberPlateStore).selectedImage;
    } else if (requiredStore is LSExteriorStore) {
      selectedImage = (requiredStore as LSExteriorStore).selectedImage;
    } else if (requiredStore is RSExteriorStore) {
      selectedImage = (requiredStore as RSExteriorStore).selectedImage;
    } else if (requiredStore is InsideCarStore) {
      selectedImage = (requiredStore as InsideCarStore).selectedImage;
    }
  }

  onUpload() {
    dialogManager.openFilePicker();
  }

  onChasisNumber(String number) {
    (requiredStore as ChasisNumberStore).onChasisNumber(number);
  }

  @action
  fromGallery() async {
    if (requiredStore is ChasisNumberStore) {
      (requiredStore as ChasisNumberStore).selectedImage =
          await _picker.chooseFromGallery();
      selectedImage = (requiredStore as ChasisNumberStore).selectedImage;
    } else if (requiredStore is NumberPlateStore) {
      (requiredStore as NumberPlateStore).selectedImage =
          await _picker.chooseFromGallery();
      selectedImage = (requiredStore as NumberPlateStore).selectedImage;
    } else if (requiredStore is LSExteriorStore) {
      (requiredStore as LSExteriorStore).selectedImage =
          await _picker.chooseFromGallery();
      selectedImage = (requiredStore as LSExteriorStore).selectedImage;
    } else if (requiredStore is RSExteriorStore) {
      (requiredStore as RSExteriorStore).selectedImage =
          await _picker.chooseFromGallery();
      selectedImage = (requiredStore as RSExteriorStore).selectedImage;
    } else if (requiredStore is InsideCarStore) {
      (requiredStore as InsideCarStore).selectedImage =
          await _picker.chooseFromGallery();
      selectedImage = (requiredStore as InsideCarStore).selectedImage;
    }
  }

  @action
  fromCamera() async {
    if (requiredStore is ChasisNumberStore) {
      (requiredStore as ChasisNumberStore).selectedImage =
          await _picker.clickViaCamera();

      selectedImage = (requiredStore as ChasisNumberStore).selectedImage;
    } else if (requiredStore is NumberPlateStore) {
      (requiredStore as NumberPlateStore).selectedImage =
          await _picker.clickViaCamera();

      selectedImage = (requiredStore as NumberPlateStore).selectedImage;
    } else if (requiredStore is LSExteriorStore) {
      (requiredStore as LSExteriorStore).selectedImage =
          await _picker.clickViaCamera();

      selectedImage = (requiredStore as LSExteriorStore).selectedImage;
    } else if (requiredStore is RSExteriorStore) {
      (requiredStore as RSExteriorStore).selectedImage =
          await _picker.clickViaCamera();

      selectedImage = (requiredStore as RSExteriorStore).selectedImage;
    } else if (requiredStore is InsideCarStore) {
      (requiredStore as InsideCarStore).selectedImage =
          await _picker.clickViaCamera();

      selectedImage = (requiredStore as InsideCarStore).selectedImage;
    }
  }

  @action
  onClose() {
    selectedImage = null;
    if (requiredStore is ChasisNumberStore) {
      (requiredStore as ChasisNumberStore).onClose();
    } else if (requiredStore is NumberPlateStore) {
      (requiredStore as NumberPlateStore).onClose();
    } else if (requiredStore is LSExteriorStore) {
      (requiredStore as LSExteriorStore).onClose();
    } else if (requiredStore is RSExteriorStore) {
      (requiredStore as RSExteriorStore).onClose();
    } else if (requiredStore is InsideCarStore) {
      (requiredStore as InsideCarStore).onClose();
    }
  }

  @action
  onDone() {
    if (requiredStore is ChasisNumberStore) {
      (requiredStore as ChasisNumberStore).onDone(
          uploading: uploader.start, //_onUploading,
          success: _onSuccess,
          error: _onError,
          responseError: _onResponseError);
    } else if (requiredStore is NumberPlateStore) {
      (requiredStore as NumberPlateStore).onDone(
          uploading: uploader.start, //_onUploading,
          success: _onSuccess,
          error: _onError,
          responseError: _onResponseError);
    } else if (requiredStore is LSExteriorStore) {
      (requiredStore as LSExteriorStore).onDone(
          uploading: uploader.start, //_onUploading
          success: _onSuccess,
          error: _onError,
          responseError: _onResponseError);
    } else if (requiredStore is RSExteriorStore) {
      (requiredStore as RSExteriorStore).onDone(
          uploading: uploader.start, //_onUploading,
          success: _onSuccess,
          error: _onError,
          responseError: _onResponseError);
    } else if (requiredStore is InsideCarStore) {
      (requiredStore as InsideCarStore).onDone(
          uploading: uploader.start, //_onUploading,
          success: _onSuccess,
          error: _onError,
          responseError: _onResponseError);
    }
  }

  @action
  _validateInputs() {
    if (requiredStore is ChasisNumberStore) {
      (requiredStore as ChasisNumberStore).validateInputs((status) {
        enableBtn = status;
      });
    } else if (requiredStore is NumberPlateStore) {
      (requiredStore as NumberPlateStore).validateInputs((status) {
        enableBtn = status;
      });
    } else if (requiredStore is LSExteriorStore) {
      (requiredStore as LSExteriorStore).validateInputs((status) {
        enableBtn = status;
      });
    } else if (requiredStore is RSExteriorStore) {
      (requiredStore as RSExteriorStore).validateInputs((status) {
        enableBtn = status;
      });
    } else if (requiredStore is InsideCarStore) {
      (requiredStore as InsideCarStore).validateInputs((status) {
        enableBtn = status;
      });
    }
  }

  onError(AlertAction? action) {
    onDone();
  }

  _onUploading(bool status, int size) {
    if (status) {
      uploader.startUploader(size);
    } else {
      uploader.stopUploader(size);
    }
  }

  _onSuccess(String message) {
    onChange(ScreenWithExtras(screen: Screen.vehicleAudit, argument: true));
  }

  _onError(String message) {
    dialogManager.initErrorData(AlertData(
        StringProvider.error,
        null,
        StringProvider.appId,
        message,
        StringProvider.retry,
        null,
        null,
        AlertBehaviour(option: AlertOption.none, action: AlertAction.none)));
  }

  _onResponseError(String message) {
    dialogManager.initErrorData(AlertData(
        StringProvider.error,
        null,
        StringProvider.appId,
        message,
        StringProvider.retry,
        null,
        null,
        AlertBehaviour(
            option: AlertOption.invokeOnBarrier, action: AlertAction.none)));
  }
}
