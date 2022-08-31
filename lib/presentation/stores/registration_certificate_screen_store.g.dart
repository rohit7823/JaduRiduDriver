// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_certificate_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegistrationCertificateStore
    on _RegistrationCertificateScreenStore, Store {
  late final _$selectedImageAtom = Atom(
      name: '_RegistrationCertificateScreenStore.selectedImage',
      context: context);

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

  late final _$enableBtnAtom = Atom(
      name: '_RegistrationCertificateScreenStore.enableBtn', context: context);

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

  late final _$openImagePickerAtom = Atom(
      name: '_RegistrationCertificateScreenStore.openImagePicker',
      context: context);

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

  late final _$informMessageAtom = Atom(
      name: '_RegistrationCertificateScreenStore.informMessage',
      context: context);

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

  late final _$fromGalleryAsyncAction = AsyncAction(
      '_RegistrationCertificateScreenStore.fromGallery',
      context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction = AsyncAction(
      '_RegistrationCertificateScreenStore.fromCamera',
      context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$_validateInputsAsyncAction = AsyncAction(
      '_RegistrationCertificateScreenStore._validateInputs',
      context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$onDoneAsyncAction = AsyncAction(
      '_RegistrationCertificateScreenStore.onDone',
      context: context);

  @override
  Future onDone() {
    return _$onDoneAsyncAction.run(() => super.onDone());
  }

  late final _$_RegistrationCertificateScreenStoreActionController =
      ActionController(
          name: '_RegistrationCertificateScreenStore', context: context);

  @override
  dynamic onOpenPickerClick() {
    final _$actionInfo =
        _$_RegistrationCertificateScreenStoreActionController.startAction(
            name: '_RegistrationCertificateScreenStore.onOpenPickerClick');
    try {
      return super.onOpenPickerClick();
    } finally {
      _$_RegistrationCertificateScreenStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSelectedImage() {
    final _$actionInfo =
        _$_RegistrationCertificateScreenStoreActionController.startAction(
            name: '_RegistrationCertificateScreenStore.clearSelectedImage');
    try {
      return super.clearSelectedImage();
    } finally {
      _$_RegistrationCertificateScreenStoreActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
enableBtn: ${enableBtn},
openImagePicker: ${openImagePicker},
informMessage: ${informMessage}
    ''';
  }
}
