// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_permit_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VehiclePermitStore on _VehiclePermitScreenStore, Store {
  late final _$isIssuedAtom =
      Atom(name: '_VehiclePermitScreenStore.isIssued', context: context);

  @override
  McqValue get isIssued {
    _$isIssuedAtom.reportRead();
    return super.isIssued;
  }

  @override
  set isIssued(McqValue value) {
    _$isIssuedAtom.reportWrite(value, super.isIssued, () {
      super.isIssued = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_VehiclePermitScreenStore.selectedDate', context: context);

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

  late final _$permitNumberAtom =
      Atom(name: '_VehiclePermitScreenStore.permitNumber', context: context);

  @override
  String get permitNumber {
    _$permitNumberAtom.reportRead();
    return super.permitNumber;
  }

  @override
  set permitNumber(String value) {
    _$permitNumberAtom.reportWrite(value, super.permitNumber, () {
      super.permitNumber = value;
    });
  }

  late final _$selectedImageAtom =
      Atom(name: '_VehiclePermitScreenStore.selectedImage', context: context);

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

  late final _$informMessageAtom =
      Atom(name: '_VehiclePermitScreenStore.informMessage', context: context);

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

  late final _$enableBtnAtom =
      Atom(name: '_VehiclePermitScreenStore.enableBtn', context: context);

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

  late final _$fromGalleryAsyncAction =
      AsyncAction('_VehiclePermitScreenStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction =
      AsyncAction('_VehiclePermitScreenStore.fromCamera', context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$_validateInputsAsyncAction = AsyncAction(
      '_VehiclePermitScreenStore._validateInputs',
      context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_VehiclePermitScreenStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_VehiclePermitScreenStoreActionController =
      ActionController(name: '_VehiclePermitScreenStore', context: context);

  @override
  dynamic onIssued(McqValue? value) {
    final _$actionInfo = _$_VehiclePermitScreenStoreActionController
        .startAction(name: '_VehiclePermitScreenStore.onIssued');
    try {
      return super.onIssued(value);
    } finally {
      _$_VehiclePermitScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onVehiclePermit(String value) {
    final _$actionInfo = _$_VehiclePermitScreenStoreActionController
        .startAction(name: '_VehiclePermitScreenStore.onVehiclePermit');
    try {
      return super.onVehiclePermit(value);
    } finally {
      _$_VehiclePermitScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearImage() {
    final _$actionInfo = _$_VehiclePermitScreenStoreActionController
        .startAction(name: '_VehiclePermitScreenStore.clearImage');
    try {
      return super.clearImage();
    } finally {
      _$_VehiclePermitScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? dateTime) {
    final _$actionInfo = _$_VehiclePermitScreenStoreActionController
        .startAction(name: '_VehiclePermitScreenStore.onSelectDate');
    try {
      return super.onSelectDate(dateTime);
    } finally {
      _$_VehiclePermitScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isIssued: ${isIssued},
selectedDate: ${selectedDate},
permitNumber: ${permitNumber},
selectedImage: ${selectedImage},
informMessage: ${informMessage},
enableBtn: ${enableBtn}
    ''';
  }
}
