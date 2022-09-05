// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'left_side_exterior_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LSExteriorStore on _LeftSideExteriorStore, Store {
  late final _$selectedImageAtom =
      Atom(name: '_LeftSideExteriorStore.selectedImage', context: context);

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
      Atom(name: '_LeftSideExteriorStore.enableBtn', context: context);

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

  late final _$validateInputsAsyncAction =
      AsyncAction('_LeftSideExteriorStore.validateInputs', context: context);

  @override
  Future validateInputs(dynamic Function(bool) callBack) {
    return _$validateInputsAsyncAction
        .run(() => super.validateInputs(callBack));
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_LeftSideExteriorStore.onDone', context: context);

  @override
  Future onDone(
      {required dynamic Function(bool, int) uploading,
      required dynamic Function(String) success,
      required dynamic Function(String) error,
      required dynamic Function(String) responseError}) {
    return _$onDoneAsyncAction.run(() => super.onDone(
        uploading: uploading,
        success: success,
        error: error,
        responseError: responseError));
  }

  late final _$_LeftSideExteriorStoreActionController =
      ActionController(name: '_LeftSideExteriorStore', context: context);

  @override
  dynamic onClose() {
    final _$actionInfo = _$_LeftSideExteriorStoreActionController.startAction(
        name: '_LeftSideExteriorStore.onClose');
    try {
      return super.onClose();
    } finally {
      _$_LeftSideExteriorStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
enableBtn: ${enableBtn}
    ''';
  }
}
