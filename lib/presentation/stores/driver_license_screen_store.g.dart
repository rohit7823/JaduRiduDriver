// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_license_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DriverLicenseStore on _DriverLicenseScreenStore, Store {
  late final _$licenseAtom =
      Atom(name: '_DriverLicenseScreenStore.license', context: context);

  @override
  String get license {
    _$licenseAtom.reportRead();
    return super.license;
  }

  @override
  set license(String value) {
    _$licenseAtom.reportWrite(value, super.license, () {
      super.license = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_DriverLicenseScreenStore.selectedDate', context: context);

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

  late final _$reEnteredLicenseAtom = Atom(
      name: '_DriverLicenseScreenStore.reEnteredLicense', context: context);

  @override
  String get reEnteredLicense {
    _$reEnteredLicenseAtom.reportRead();
    return super.reEnteredLicense;
  }

  @override
  set reEnteredLicense(String value) {
    _$reEnteredLicenseAtom.reportWrite(value, super.reEnteredLicense, () {
      super.reEnteredLicense = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_DriverLicenseScreenStore.enableBtn', context: context);

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

  late final _$selectedImageAtom =
      Atom(name: '_DriverLicenseScreenStore.selectedImage', context: context);

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

  late final _$warnMessageAtom =
      Atom(name: '_DriverLicenseScreenStore.warnMessage', context: context);

  @override
  String get warnMessage {
    _$warnMessageAtom.reportRead();
    return super.warnMessage;
  }

  @override
  set warnMessage(String value) {
    _$warnMessageAtom.reportWrite(value, super.warnMessage, () {
      super.warnMessage = value;
    });
  }

  late final _$informMessageAtom =
      Atom(name: '_DriverLicenseScreenStore.informMessage', context: context);

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

  late final _$imagePickerAtom =
      Atom(name: '_DriverLicenseScreenStore.imagePicker', context: context);

  @override
  DialogState get imagePicker {
    _$imagePickerAtom.reportRead();
    return super.imagePicker;
  }

  @override
  set imagePicker(DialogState value) {
    _$imagePickerAtom.reportWrite(value, super.imagePicker, () {
      super.imagePicker = value;
    });
  }

  late final _$_validateInputsAsyncAction = AsyncAction(
      '_DriverLicenseScreenStore._validateInputs',
      context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$fromGalleryAsyncAction =
      AsyncAction('_DriverLicenseScreenStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction =
      AsyncAction('_DriverLicenseScreenStore.fromCamera', context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_DriverLicenseScreenStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_DriverLicenseScreenStoreActionController =
      ActionController(name: '_DriverLicenseScreenStore', context: context);

  @override
  dynamic onClose() {
    final _$actionInfo = _$_DriverLicenseScreenStoreActionController
        .startAction(name: '_DriverLicenseScreenStore.onClose');
    try {
      return super.onClose();
    } finally {
      _$_DriverLicenseScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic driverLicense(String lic) {
    final _$actionInfo = _$_DriverLicenseScreenStoreActionController
        .startAction(name: '_DriverLicenseScreenStore.driverLicense');
    try {
      return super.driverLicense(lic);
    } finally {
      _$_DriverLicenseScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic repeatedDriverLicense(String lic) {
    final _$actionInfo = _$_DriverLicenseScreenStoreActionController
        .startAction(name: '_DriverLicenseScreenStore.repeatedDriverLicense');
    try {
      return super.repeatedDriverLicense(lic);
    } finally {
      _$_DriverLicenseScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic openImageChoosingDialog() {
    final _$actionInfo = _$_DriverLicenseScreenStoreActionController
        .startAction(name: '_DriverLicenseScreenStore.openImageChoosingDialog');
    try {
      return super.openImageChoosingDialog();
    } finally {
      _$_DriverLicenseScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? selected) {
    final _$actionInfo = _$_DriverLicenseScreenStoreActionController
        .startAction(name: '_DriverLicenseScreenStore.onSelectDate');
    try {
      return super.onSelectDate(selected);
    } finally {
      _$_DriverLicenseScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
license: ${license},
selectedDate: ${selectedDate},
reEnteredLicense: ${reEnteredLicense},
enableBtn: ${enableBtn},
selectedImage: ${selectedImage},
warnMessage: ${warnMessage},
informMessage: ${informMessage},
imagePicker: ${imagePicker}
    ''';
  }
}
