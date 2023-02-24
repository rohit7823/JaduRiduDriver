import 'dart:io';

import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/uploader_implementation.dart';
import 'package:jadu_ride_driver/core/helpers/my_date_time.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_pollution_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/date_time_helper.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../utills/extensions.dart';

part 'vehicle_pollution_screen_store.g.dart';

class VehiclePollutionStore = _VehiclePollutionScreenStore
    with _$VehiclePollutionStore;

abstract class _VehiclePollutionScreenStore extends AppNavigator with Store {
  final _repository = dependency<VehiclePollutionRepository>();
  final _storage = dependency<Storage>();
  final uploader = Uploader(implementation: UploaderImplementation.real);
  final dialogManager = DialogManager();
  final _picker = ImageFilePicker();
  final _dateTimeHelper = DateTimeHelper();

  @observable
  File? selectedImage;

  @observable
  String selectedDate = StringProvider.expiryDate;

  @observable
  String informMessage = "";

  @observable
  bool enableBtn = false;

  @observable
  bool prefillLoader = false;

  _VehiclePollutionScreenStore() {
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
        } else if(key == "expiary_date") {
          selectedDate = value;
        }
      });
    }
    prefillLoader = false;
  }


  @action
  _validateInputs() async {
    while (true) {
      if (selectedImage == null) {
        enableBtn = false;
      } else if (selectedDate == StringProvider.expiryDate) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  onSelectedDate(DateTime? selected) {
    if (selected != null) {
      selectedDate =
          "${selected.day} ${_dateTimeHelper.getMonthName(selected.month)}, ${_dateTimeHelper.getWeekDayName(selected.weekday)}, ${selected.year}";
    } else {
      selectedDate = StringProvider.expiryDate;
    }
  }

  openImagePicker() {
    dialogManager.openFilePicker();
  }

  openDatePicker() {
    dialogManager.openDatePicker();
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
  onDone() async {
    var userId = _storage.userId();
    var response = await _repository.uploadPollution(
        userId, selectedDate, selectedImage!, uploader.start);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isSubmitted) {
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
                    action: AlertAction.uploadPollution)));
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
                  action: AlertAction.uploadPollution)));
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
              option: AlertOption.none, action: AlertAction.uploadPollution)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadPollution) {
      onDone();
    }
  }
}
