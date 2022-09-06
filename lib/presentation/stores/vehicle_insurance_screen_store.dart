import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_insurance_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/date_time_helper.dart';
import 'package:jadu_ride_driver/helpers_impls/image_file_picker.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/custom_widgets/mcq_view.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/uploader.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'vehicle_insurance_screen_store.g.dart';

class VehicleInsuranceStore = _VehicleInsuranceScreenStore
    with _$VehicleInsuranceStore;

abstract class _VehicleInsuranceScreenStore extends AppNavigator with Store {
  final _repository = dependency<VehicleInsuranceRepository>();
  final _storage = dependency<Storage>();
  final uploader = Uploader(implementation: UploaderImplementation.real);
  final dialogManager = DialogManager();
  final _picker = ImageFilePicker();
  final _dateTimeHelper = DateTimeHelper();

  @observable
  McqValue isValid = McqValue.no;

  @observable
  String validityDate = "";

  @observable
  String insuranceNumber = "";

  @observable
  File? selectedImage;

  @observable
  bool enableBtn = false;

  @observable
  DialogState openDatePicker = DialogState.notDisplaying;

  @observable
  DialogState openImagePicker = DialogState.notDisplaying;

  @observable
  String selectedDate = StringProvider.validTill;

  @observable
  String informMessage = "";

  _VehicleInsuranceScreenStore() {
    _validateInputs();
  }

  @action
  _validateInputs() async {
    while (true) {
      if (isValid == McqValue.no) {
        enableBtn = false;
      } else if (selectedDate == StringProvider.validTill) {
        enableBtn = false;
      } else if (selectedImage == null) {
        enableBtn = false;
      } else if (insuranceNumber.isEmpty) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  onIsValidInsurance(McqValue? selected) async {
    isValid = selected ?? McqValue.no;
    await Future.delayed(const Duration(milliseconds: 300));
  }

  @action
  onInsuranceNumber(String number) {
    insuranceNumber = number;
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
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      var month = _dateTimeHelper.getMonthName(selected.month);
      var weekDay = _dateTimeHelper.getWeekDayName(selected.weekday);
      selectedDate = "${selected.day} $month, $weekDay, ${selected.year}";
    } else {
      selectedDate = StringProvider.validTill;
    }
  }

  @action
  onImagePicker() {
    openImagePicker = DialogState.displaying;
  }

  @action
  clearSelectedImage() {
    selectedImage = null;
  }

  @action
  dismissImagePicker() {
    openImagePicker = DialogState.notDisplaying;
  }

  @action
  onDatePicker() {
    openDatePicker = DialogState.displaying;
  }

  @action
  dismissDatePicker() {
    openDatePicker = DialogState.notDisplaying;
  }

  @action
  onDone() async {
    var userId = _storage.userId();
    var response = await _repository.uploadInsurance(userId, insuranceNumber,
        selectedDate, isValid.key, selectedImage!, uploader.start);

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
                    action: AlertAction.uploadVehicleInsurance)));
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
                  action: AlertAction.uploadVehicleInsurance)));
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
              action: AlertAction.uploadVehicleInsurance)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.uploadVehicleInsurance) {
      onDone();
    }
  }
}
