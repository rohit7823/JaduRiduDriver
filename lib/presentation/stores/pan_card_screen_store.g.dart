// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pan_card_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PanCardStore on _PanCardScreenStore, Store {
  late final _$panNumberAtom =
      Atom(name: '_PanCardScreenStore.panNumber', context: context);

  @override
  String get panNumber {
    _$panNumberAtom.reportRead();
    return super.panNumber;
  }

  @override
  set panNumber(String value) {
    _$panNumberAtom.reportWrite(value, super.panNumber, () {
      super.panNumber = value;
    });
  }

  late final _$selectedImageAtom =
      Atom(name: '_PanCardScreenStore.selectedImage', context: context);

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
      Atom(name: '_PanCardScreenStore.enableBtn', context: context);

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

  late final _$errorMessageAtom =
      Atom(name: '_PanCardScreenStore.errorMessage', context: context);

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

  late final _$informMessageAtom =
      Atom(name: '_PanCardScreenStore.informMessage', context: context);

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

  late final _$openPickerDialogAtom =
      Atom(name: '_PanCardScreenStore.openPickerDialog', context: context);

  @override
  DialogState get openPickerDialog {
    _$openPickerDialogAtom.reportRead();
    return super.openPickerDialog;
  }

  @override
  set openPickerDialog(DialogState value) {
    _$openPickerDialogAtom.reportWrite(value, super.openPickerDialog, () {
      super.openPickerDialog = value;
    });
  }

  late final _$_validateInputsAsyncAction =
      AsyncAction('_PanCardScreenStore._validateInputs', context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$fromGalleryAsyncAction =
      AsyncAction('_PanCardScreenStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$formCameraAsyncAction =
      AsyncAction('_PanCardScreenStore.formCamera', context: context);

  @override
  Future formCamera() {
    return _$formCameraAsyncAction.run(() => super.formCamera());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_PanCardScreenStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_PanCardScreenStoreActionController =
      ActionController(name: '_PanCardScreenStore', context: context);

  @override
  dynamic onUpload() {
    final _$actionInfo = _$_PanCardScreenStoreActionController.startAction(
        name: '_PanCardScreenStore.onUpload');
    try {
      return super.onUpload();
    } finally {
      _$_PanCardScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelected() {
    final _$actionInfo = _$_PanCardScreenStoreActionController.startAction(
        name: '_PanCardScreenStore.clearSelected');
    try {
      return super.clearSelected();
    } finally {
      _$_PanCardScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPanNumber(String value) {
    final _$actionInfo = _$_PanCardScreenStoreActionController.startAction(
        name: '_PanCardScreenStore.onPanNumber');
    try {
      return super.onPanNumber(value);
    } finally {
      _$_PanCardScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
panNumber: ${panNumber},
selectedImage: ${selectedImage},
enableBtn: ${enableBtn},
errorMessage: ${errorMessage},
informMessage: ${informMessage},
openPickerDialog: ${openPickerDialog}
    ''';
  }
}
