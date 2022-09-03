// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_general_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuditGeneralStore on _AuditGeneralStore, Store {
  late final _$selectedImageAtom =
      Atom(name: '_AuditGeneralStore.selectedImage', context: context);

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

  late final _$chasisNumberAtom =
      Atom(name: '_AuditGeneralStore.chasisNumber', context: context);

  @override
  String get chasisNumber {
    _$chasisNumberAtom.reportRead();
    return super.chasisNumber;
  }

  @override
  set chasisNumber(String value) {
    _$chasisNumberAtom.reportWrite(value, super.chasisNumber, () {
      super.chasisNumber = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_AuditGeneralStore.enableBtn', context: context);

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
      AsyncAction('_AuditGeneralStore.fromGallery', context: context);

  @override
  Future fromGallery() {
    return _$fromGalleryAsyncAction.run(() => super.fromGallery());
  }

  late final _$fromCameraAsyncAction =
      AsyncAction('_AuditGeneralStore.fromCamera', context: context);

  @override
  Future fromCamera() {
    return _$fromCameraAsyncAction.run(() => super.fromCamera());
  }

  late final _$_AuditGeneralStoreActionController =
      ActionController(name: '_AuditGeneralStore', context: context);

  @override
  dynamic init() {
    final _$actionInfo = _$_AuditGeneralStoreActionController.startAction(
        name: '_AuditGeneralStore.init');
    try {
      return super.init();
    } finally {
      _$_AuditGeneralStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onClose() {
    final _$actionInfo = _$_AuditGeneralStoreActionController.startAction(
        name: '_AuditGeneralStore.onClose');
    try {
      return super.onClose();
    } finally {
      _$_AuditGeneralStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDone() {
    final _$actionInfo = _$_AuditGeneralStoreActionController.startAction(
        name: '_AuditGeneralStore.onDone');
    try {
      return super.onDone();
    } finally {
      _$_AuditGeneralStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _validateInputs() {
    final _$actionInfo = _$_AuditGeneralStoreActionController.startAction(
        name: '_AuditGeneralStore._validateInputs');
    try {
      return super._validateInputs();
    } finally {
      _$_AuditGeneralStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
chasisNumber: ${chasisNumber},
enableBtn: ${enableBtn}
    ''';
  }
}
