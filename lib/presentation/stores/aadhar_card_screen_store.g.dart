// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aadhar_card_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AadharCardStore on _AadharCardScreenStore, Store {
  late final _$aaharNumberAtom =
      Atom(name: '_AadharCardScreenStore.aaharNumber', context: context);

  @override
  String get aaharNumber {
    _$aaharNumberAtom.reportRead();
    return super.aaharNumber;
  }

  @override
  set aaharNumber(String value) {
    _$aaharNumberAtom.reportWrite(value, super.aaharNumber, () {
      super.aaharNumber = value;
    });
  }

  late final _$selectedImageAtom =
      Atom(name: '_AadharCardScreenStore.selectedImage', context: context);

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
      Atom(name: '_AadharCardScreenStore.enableBtn', context: context);

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

  late final _$informMessageAtom =
      Atom(name: '_AadharCardScreenStore.informMessage', context: context);

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
      Atom(name: '_AadharCardScreenStore.imagePicker', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_AadharCardScreenStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$prefillLoaderAtom =
      Atom(name: '_AadharCardScreenStore.prefillLoader', context: context);

  @override
  bool get prefillLoader {
    _$prefillLoaderAtom.reportRead();
    return super.prefillLoader;
  }

  @override
  set prefillLoader(bool value) {
    _$prefillLoaderAtom.reportWrite(value, super.prefillLoader, () {
      super.prefillLoader = value;
    });
  }

  late final _$prefillDataAsyncAction =
      AsyncAction('_AadharCardScreenStore.prefillData', context: context);

  @override
  Future prefillData() {
    return _$prefillDataAsyncAction.run(() => super.prefillData());
  }

  late final _$_validateInputsAsyncAction =
      AsyncAction('_AadharCardScreenStore._validateInputs', context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$fromGalleryAsyncAction =
      AsyncAction('_AadharCardScreenStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction =
      AsyncAction('_AadharCardScreenStore.fromCamera', context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_AadharCardScreenStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_AadharCardScreenStoreActionController =
      ActionController(name: '_AadharCardScreenStore', context: context);

  @override
  dynamic openImagePicker() {
    final _$actionInfo = _$_AadharCardScreenStoreActionController.startAction(
        name: '_AadharCardScreenStore.openImagePicker');
    try {
      return super.openImagePicker();
    } finally {
      _$_AadharCardScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeImagePicker() {
    final _$actionInfo = _$_AadharCardScreenStoreActionController.startAction(
        name: '_AadharCardScreenStore.closeImagePicker');
    try {
      return super.closeImagePicker();
    } finally {
      _$_AadharCardScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onClose() {
    final _$actionInfo = _$_AadharCardScreenStoreActionController.startAction(
        name: '_AadharCardScreenStore.onClose');
    try {
      return super.onClose();
    } finally {
      _$_AadharCardScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAadharNumber(String number) {
    final _$actionInfo = _$_AadharCardScreenStoreActionController.startAction(
        name: '_AadharCardScreenStore.onAadharNumber');
    try {
      return super.onAadharNumber(number);
    } finally {
      _$_AadharCardScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
aaharNumber: ${aaharNumber},
selectedImage: ${selectedImage},
enableBtn: ${enableBtn},
informMessage: ${informMessage},
imagePicker: ${imagePicker},
errorMessage: ${errorMessage},
prefillLoader: ${prefillLoader}
    ''';
  }
}
