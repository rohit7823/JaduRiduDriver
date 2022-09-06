import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
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
import 'package:jadu_ride_driver/core/repository/driver_license_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/date_time_helper.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'driver_license_screen_store.g.dart';

class DriverLicenseStore = _DriverLicenseScreenStore with _$DriverLicenseStore;

abstract class _DriverLicenseScreenStore extends AppNavigator with Store {
  final _repository = dependency<DriverLicenseRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();
  final uploader = Uploader(implementation: UploaderImplementation.real);
  final _picker = ImageFilePicker();
  final _dateTimeHelper = DateTimeHelper();

  @observable
  String license = "";

  @observable
  String selectedDate = StringProvider.expiry;

  @observable
  String reEnteredLicense = "";

  @observable
  bool enableBtn = false;

  @observable
  File? selectedImage;

  @observable
  String warnMessage = "";

  @observable
  String informMessage = "";

  @observable
  DialogState imagePicker = DialogState.notDisplaying;

  _DriverLicenseScreenStore() {
    _validateInputs();
  }

  @action
  _validateInputs() async {
    while (true) {
      if (license.isEmpty) {
        enableBtn = false;
      } else if (reEnteredLicense.isEmpty) {
        enableBtn = false;
      } else if (selectedImage == null) {
        enableBtn = false;
      } else if (selectedDate == StringProvider.expiry) {
        enableBtn = false;
      } else {
        if (license != reEnteredLicense) {
          enableBtn = false;
          warnMessage = StringProvider.didNotMatched;
        } else {
          enableBtn = true;
          warnMessage = "";
        }
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  onClose() {
    selectedImage = null;
  }

  @action
  driverLicense(String lic) {
    license = lic;
  }

  @action
  repeatedDriverLicense(String lic) {
    reEnteredLicense = lic;
  }

  @action
  openImageChoosingDialog() {
    imagePicker = DialogState.displaying;
  }

  @action
  fromGallery() async {
    selectedImage = await _picker.chooseFromGallery();
  }

  @action
  fromCamera() async {
    selectedImage = await _picker.clickViaCamera();
  }

  openDatePicker() {
    dialogManager.openDatePicker();
  }

  @action
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      selectedDate =
          "${selected.day} ${_dateTimeHelper.getMonthName(selected.month)}, ${_dateTimeHelper.getWeekDayName(selected.weekday)}, ${selected.year}";
    } else {
      selectedDate = StringProvider.expiry;
    }
  }

  @action
  onDone() async {
    var userId = _storage.userId();
    var response = await _repository.uploadLicense(
        userId, license, selectedImage!, selectedDate, uploader.start);

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
                    action: AlertAction.uploadDriverLicense)));
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
                  action: AlertAction.uploadDriverLicense)));
      }
    } else {
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none,
              action: AlertAction.uploadDriverLicense)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadDriverLicense) {
      onDone();
    }
  }
}
