// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_pollution_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VehiclePollutionStore on _VehiclePollutionScreenStore, Store {
  late final _$selectedImageAtom = Atom(
      name: '_VehiclePollutionScreenStore.selectedImage', context: context);

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

  late final _$selectedDateAtom =
      Atom(name: '_VehiclePollutionScreenStore.selectedDate', context: context);

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
      name: '_VehiclePollutionScreenStore.informMessage', context: context);

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
      Atom(name: '_VehiclePollutionScreenStore.enableBtn', context: context);

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

  late final _$_validateInputsAsyncAction = AsyncAction(
      '_VehiclePollutionScreenStore._validateInputs',
      context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$fromGalleryAsyncAction =
      AsyncAction('_VehiclePollutionScreenStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction =
      AsyncAction('_VehiclePollutionScreenStore.fromCamera', context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_VehiclePollutionScreenStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_VehiclePollutionScreenStoreActionController =
      ActionController(name: '_VehiclePollutionScreenStore', context: context);

  @override
  dynamic onSelectedDate(DateTime? selected) {
    final _$actionInfo = _$_VehiclePollutionScreenStoreActionController
        .startAction(name: '_VehiclePollutionScreenStore.onSelectedDate');
    try {
      return super.onSelectedDate(selected);
    } finally {
      _$_VehiclePollutionScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelectedImage() {
    final _$actionInfo = _$_VehiclePollutionScreenStoreActionController
        .startAction(name: '_VehiclePollutionScreenStore.clearSelectedImage');
    try {
      return super.clearSelectedImage();
    } finally {
      _$_VehiclePollutionScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
selectedDate: ${selectedDate},
informMessage: ${informMessage},
enableBtn: ${enableBtn}
    ''';
  }
}
