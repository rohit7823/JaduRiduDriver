import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/dialog_state.dart';
import 'package:mobx/mobx.dart';

part 'dialog_manager.g.dart';

class DialogManager = _DialogManager with _$DialogManager;

abstract class _DialogManager with Store {
  @observable
  DialogState _state = DialogState.notDisplaying;

  @computed
  DialogState get currentState => _state;

  @observable
  DialogState _errorState = DialogState.notDisplaying;

  @computed
  DialogState get currentErrorState => _errorState;

  @observable
  DialogState _filePickerDialog = DialogState.notDisplaying;

  @computed
  DialogState get filePickerState => _filePickerDialog;

  @observable
  DialogState _datePicker = DialogState.notDisplaying;

  @computed
  DialogState get datePickerState => _datePicker;

  @observable
  AlertData? data;

  @observable
  AlertData? errorData;

  @action
  initData(AlertData alertData, {DialogState state = DialogState.displaying}) {
    data = alertData;
    if (currentState == DialogState.notDisplaying) {
      _state = state;
    }
  }

  @action
  initErrorData(AlertData alertData,
      {DialogState errorState = DialogState.displaying}) {
    errorData = alertData;
    if (currentErrorState == DialogState.notDisplaying) {
      _errorState = errorState;
    }
  }

  @action
  openFilePicker() {
    _filePickerDialog = DialogState.displaying;
  }

  @action
  clearFilePicker() {
    _filePickerDialog = DialogState.notDisplaying;
  }

  @action
  openDatePicker() {
    _datePicker = DialogState.displaying;
  }

  @action
  closeDatePicker() {
    _datePicker = DialogState.notDisplaying;
  }

  @action
  closeDialog() {
    _state = DialogState.notDisplaying;
  }

  @action
  closeErrorDialog() {
    _errorState = DialogState.notDisplaying;
  }
}
