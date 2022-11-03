// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_inside_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InsideCarStore on _CarInsideStore, Store {
  late final _$enableBtnAtom =
      Atom(name: '_CarInsideStore.enableBtn', context: context);

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
      Atom(name: '_CarInsideStore.selectedImage', context: context);

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

  late final _$validateInputsAsyncAction =
      AsyncAction('_CarInsideStore.validateInputs', context: context);

  @override
  Future validateInputs(dynamic Function(bool) callBack) {
    return _$validateInputsAsyncAction
        .run(() => super.validateInputs(callBack));
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_CarInsideStore.onDone', context: context);

  @override
  Future onDone(
      {required dynamic Function(int, int) uploading,
      required dynamic Function(String) success,
      required dynamic Function(String) error,
      required dynamic Function(String) responseError}) {
    return _$onDoneAsyncAction.run(() => super.onDone(
        uploading: uploading,
        success: success,
        error: error,
        responseError: responseError));
  }

  late final _$_CarInsideStoreActionController =
      ActionController(name: '_CarInsideStore', context: context);

  @override
  dynamic onClose() {
    final _$actionInfo = _$_CarInsideStoreActionController.startAction(
        name: '_CarInsideStore.onClose');
    try {
      return super.onClose();
    } finally {
      _$_CarInsideStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableBtn: ${enableBtn},
selectedImage: ${selectedImage}
    ''';
  }
}
