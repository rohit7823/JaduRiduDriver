// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_picture_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfilePictureStore on _ProfilePictureScreenStore, Store {
  late final _$enableBtnAtom =
      Atom(name: '_ProfilePictureScreenStore.enableBtn', context: context);

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
      Atom(name: '_ProfilePictureScreenStore.informMessage', context: context);

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

  late final _$openImagePickerAtom = Atom(
      name: '_ProfilePictureScreenStore.openImagePicker', context: context);

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

  late final _$selectedImageAtom =
      Atom(name: '_ProfilePictureScreenStore.selectedImage', context: context);

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

  late final _$chooseFromCameraAsyncAction = AsyncAction(
      '_ProfilePictureScreenStore.chooseFromCamera',
      context: context);

  @override
  Future chooseFromCamera() {
    return _$chooseFromCameraAsyncAction.run(() => super.chooseFromCamera());
  }

  late final _$chooseFromGalleryAsyncAction = AsyncAction(
      '_ProfilePictureScreenStore.chooseFromGallery',
      context: context);

  @override
  Future chooseFromGallery() {
    return _$chooseFromGalleryAsyncAction.run(() => super.chooseFromGallery());
  }

  late final _$_validateInputsAsyncAction = AsyncAction(
      '_ProfilePictureScreenStore._validateInputs',
      context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_ProfilePictureScreenStore.onDone', context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_ProfilePictureScreenStoreActionController =
      ActionController(name: '_ProfilePictureScreenStore', context: context);

  @override
  dynamic selectImage() {
    final _$actionInfo = _$_ProfilePictureScreenStoreActionController
        .startAction(name: '_ProfilePictureScreenStore.selectImage');
    try {
      return super.selectImage();
    } finally {
      _$_ProfilePictureScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onClose() {
    final _$actionInfo = _$_ProfilePictureScreenStoreActionController
        .startAction(name: '_ProfilePictureScreenStore.onClose');
    try {
      return super.onClose();
    } finally {
      _$_ProfilePictureScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearImage() {
    final _$actionInfo = _$_ProfilePictureScreenStoreActionController
        .startAction(name: '_ProfilePictureScreenStore.clearImage');
    try {
      return super.clearImage();
    } finally {
      _$_ProfilePictureScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableBtn: ${enableBtn},
informMessage: ${informMessage},
openImagePicker: ${openImagePicker},
selectedImage: ${selectedImage}
    ''';
  }
}
