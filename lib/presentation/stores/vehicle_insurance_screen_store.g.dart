// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_insurance_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VehicleInsuranceStore on _VehicleInsuranceScreenStore, Store {
  late final _$isValidAtom =
      Atom(name: '_VehicleInsuranceScreenStore.isValid', context: context);

  @override
  McqValue get isValid {
    _$isValidAtom.reportRead();
    return super.isValid;
  }

  @override
  set isValid(McqValue value) {
    _$isValidAtom.reportWrite(value, super.isValid, () {
      super.isValid = value;
    });
  }

  late final _$validityDateAtom =
      Atom(name: '_VehicleInsuranceScreenStore.validityDate', context: context);

  @override
  String get validityDate {
    _$validityDateAtom.reportRead();
    return super.validityDate;
  }

  @override
  set validityDate(String value) {
    _$validityDateAtom.reportWrite(value, super.validityDate, () {
      super.validityDate = value;
    });
  }

  late final _$insuranceNumberAtom = Atom(
      name: '_VehicleInsuranceScreenStore.insuranceNumber', context: context);

  @override
  String get insuranceNumber {
    _$insuranceNumberAtom.reportRead();
    return super.insuranceNumber;
  }

  @override
  set insuranceNumber(String value) {
    _$insuranceNumberAtom.reportWrite(value, super.insuranceNumber, () {
      super.insuranceNumber = value;
    });
  }

  late final _$selectedImageAtom = Atom(
      name: '_VehicleInsuranceScreenStore.selectedImage', context: context);

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_VehicleInsuranceScreenStore.enableBtn', context: context);

  @override
  bool get enableBtn {
    _$enableBtnAtom.reportRead();
    return super.enableBtn;
  }

  @override
  set enableBtn(bool value) {
    _$enableBtnAtom.reportWrite(value, super.enableBtn, () {
      super.enableBtn = value;
    });
  }

  late final _$openDatePickerAtom = Atom(
      name: '_VehicleInsuranceScreenStore.openDatePicker', context: context);

  @override
  DialogState get openDatePicker {
    _$openDatePickerAtom.reportRead();
    return super.openDatePicker;
  }

  @override
  set openDatePicker(DialogState value) {
    _$openDatePickerAtom.reportWrite(value, super.openDatePicker, () {
      super.openDatePicker = value;
    });
  }

  late final _$openImagePickerAtom = Atom(
      name: '_VehicleInsuranceScreenStore.openImagePicker', context: context);

  @override
  DialogState get openImagePicker {
    _$openImagePickerAtom.reportRead();
    return super.openImagePicker;
  }

  @override
  set openImagePicker(DialogState value) {
    _$openImagePickerAtom.reportWrite(value, super.openImagePicker, () {
      super.openImagePicker = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_VehicleInsuranceScreenStore.selectedDate', context: context);

  @override
  String get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(String value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$informMessageAtom = Atom(
      name: '_VehicleInsuranceScreenStore.informMessage', context: context);

  @override
  String get informMessage {
    _$informMessageAtom.reportRead();
    return super.informMessage;
  }

  @override
  set informMessage(String value) {
    _$informMessageAtom.reportWrite(value, super.informMessage, () {
      super.informMessage = value;
    });
  }

  late final _$_validateInputsAsyncAction = AsyncAction(
      '_VehicleInsuranceScreenStore._validateInputs',
      context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$onIsValidInsuranceAsyncAction = AsyncAction(
      '_VehicleInsuranceScreenStore.onIsValidInsurance',
      context: context);

  @override
  Future onIsValidInsurance(McqValue? selected) {
    return _$onIsValidInsuranceAsyncAction
        .run(() => super.onIsValidInsurance(selected));
  }

  late final _$fromGalleryAsyncAction =
      AsyncAction('_VehicleInsuranceScreenStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction =
      AsyncAction('_VehicleInsuranceScreenStore.fromCamera', context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_VehicleInsuranceScreenStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_VehicleInsuranceScreenStoreActionController =
      ActionController(name: '_VehicleInsuranceScreenStore', context: context);

  @override
  dynamic onInsuranceNumber(String number) {
    final _$actionInfo = _$_VehicleInsuranceScreenStoreActionController
        .startAction(name: '_VehicleInsuranceScreenStore.onInsuranceNumber');
    try {
      return super.onInsuranceNumber(number);
    } finally {
      _$_VehicleInsuranceScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? selected) {
    final _$actionInfo = _$_VehicleInsuranceScreenStoreActionController
        .startAction(name: '_VehicleInsuranceScreenStore.onSelectDate');
    try {
      return super.onSelectDate(selected);
    } finally {
      _$_VehicleInsuranceScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onImagePicker() {
    final _$actionInfo = _$_VehicleInsuranceScreenStoreActionController
        .startAction(name: '_VehicleInsuranceScreenStore.onImagePicker');
    try {
      return super.onImagePicker();
    } finally {
      _$_VehicleInsuranceScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelectedImage() {
    final _$actionInfo = _$_VehicleInsuranceScreenStoreActionController
        .startAction(name: '_VehicleInsuranceScreenStore.clearSelectedImage');
    try {
      return super.clearSelectedImage();
    } finally {
      _$_VehicleInsuranceScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dismissImagePicker() {
    final _$actionInfo = _$_VehicleInsuranceScreenStoreActionController
        .startAction(name: '_VehicleInsuranceScreenStore.dismissImagePicker');
    try {
      return super.dismissImagePicker();
    } finally {
      _$_VehicleInsuranceScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDatePicker() {
    final _$actionInfo = _$_VehicleInsuranceScreenStoreActionController
        .startAction(name: '_VehicleInsuranceScreenStore.onDatePicker');
    try {
      return super.onDatePicker();
    } finally {
      _$_VehicleInsuranceScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic dismissDatePicker() {
    final _$actionInfo = _$_VehicleInsuranceScreenStoreActionController
        .startAction(name: '_VehicleInsuranceScreenStore.dismissDatePicker');
    try {
      return super.dismissDatePicker();
    } finally {
      _$_VehicleInsuranceScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isValid: ${isValid},
validityDate: ${validityDate},
insuranceNumber: ${insuranceNumber},
selectedImage: ${selectedImage},
enableBtn: ${enableBtn},
openDatePicker: ${openDatePicker},
openImagePicker: ${openImagePicker},
selectedDate: ${selectedDate},
informMessage: ${informMessage}
    ''';
  }
}
