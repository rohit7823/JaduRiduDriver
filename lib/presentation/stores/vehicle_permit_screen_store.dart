import 'dart:io';

import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:jadu_ride_driver/core/common/mcq_value.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/uploader_implementation.dart';
import 'package:jadu_ride_driver/core/helpers/my_date_time.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_permit_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/date_time_helper.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/mcq_view.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

part 'vehicle_permit_screen_store.g.dart';

class VehiclePermitStore = _VehiclePermitScreenStore with _$VehiclePermitStore;

abstract class _VehiclePermitScreenStore extends AppNavigator with Store {
  final _repository = dependency<VehiclePermitRepository>();
  final _storage = dependency<Storage>();
  final _picker = ImageFilePicker();
  final _dateTimeHelper = DateTimeHelper();
  final dialogManager = DialogManager();
  final uploader = Uploader(implementation: UploaderImplementation.real);

  @observable
  McqValue isIssued = McqValue.no;

  @observable
  String selectedDate = StringProvider.issuedOn;

  @observable
  String permitNumber = "";

  @observable
  File? selectedImage;

  @observable
  String informMessage = "";

  @observable
  bool enableBtn = false;

  @observable
  bool prefillLoader = false;

  _VehiclePermitScreenStore() {
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
        } else if(key == "value") {
          permitNumber = value;
        }
      });
    }
    prefillLoader = false;
  }

  @action
  onIssued(McqValue? value) {
    isIssued = value ?? McqValue.no;
  }

  @action
  onVehiclePermit(String value) {
    permitNumber = value;
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
  clearImage() {
    selectedImage = null;
  }

  onUpload() {
    dialogManager.openFilePicker();
  }

  onChoose() {
    dialogManager.openDatePicker();
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadVehiclePermit) {
      onDone();
    }
  }

  @action
  onSelectDate(DateTime? dateTime) {
    if (dateTime != null) {
      selectedDate =
          "${dateTime.day} ${_dateTimeHelper.getMonthName(dateTime.month)}, ${_dateTimeHelper.getWeekDayName(dateTime.weekday)}, ${dateTime.year}";
    } else {
      selectedDate = StringProvider.issuedOn;
    }
  }

  @action
  _validateInputs() async {
    while (true) {
      if (selectedImage == null) {
        enableBtn = false;
      } else if (selectedDate == StringProvider.issuedOn) {
        enableBtn = false;
      } else if (permitNumber.isEmpty) {
        enableBtn = false;
      } else if (isIssued == McqValue.no) {
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
    var response = await _repository.uploadPermit(userId, permitNumber,
        selectedDate, isIssued.key, selectedImage!, uploader.start);

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
                    action: AlertAction.uploadVehiclePermit)));
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
                  action: AlertAction.uploadVehiclePermit)));
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
              option: AlertOption.none,
              action: AlertAction.uploadVehiclePermit)));
    }
  }
}
