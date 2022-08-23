// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'number_input_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NumberInputStore on _NumberInputScreenStore, Store {
  late final _$gettingDataLoaderAtom =
      Atom(name: '_NumberInputScreenStore.gettingDataLoader', context: context);

  @override
  bool get gettingDataLoader {
    _$gettingDataLoaderAtom.reportRead();
    return super.gettingDataLoader;
  }

  @override
  set gettingDataLoader(bool value) {
    _$gettingDataLoaderAtom.reportWrite(value, super.gettingDataLoader, () {
      super.gettingDataLoader = value;
    });
  }

  late final _$sendingLoaderAtom =
      Atom(name: '_NumberInputScreenStore.sendingLoader', context: context);

  @override
  bool get sendingLoader {
    _$sendingLoaderAtom.reportRead();
    return super.sendingLoader;
  }

  @override
  set sendingLoader(bool value) {
    _$sendingLoaderAtom.reportWrite(value, super.sendingLoader, () {
      super.sendingLoader = value;
    });
  }

  late final _$codesAtom =
      Atom(name: '_NumberInputScreenStore.codes', context: context);

  @override
  List<MobileNumberCode> get codes {
    _$codesAtom.reportRead();
    return super.codes;
  }

  @override
  set codes(List<MobileNumberCode> value) {
    _$codesAtom.reportWrite(value, super.codes, () {
      super.codes = value;
    });
  }

  late final _$mobileNumberAtom =
      Atom(name: '_NumberInputScreenStore.mobileNumber', context: context);

  @override
  String get mobileNumber {
    _$mobileNumberAtom.reportRead();
    return super.mobileNumber;
  }

  @override
  set mobileNumber(String value) {
    _$mobileNumberAtom.reportWrite(value, super.mobileNumber, () {
      super.mobileNumber = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_NumberInputScreenStore.enableBtn', context: context);

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

  late final _$getNumberCodesAsyncAction =
      AsyncAction('_NumberInputScreenStore.getNumberCodes', context: context);

  @override
  Future getNumberCodes() {
    return _$getNumberCodesAsyncAction.run(() => super.getNumberCodes());
  }

  late final _$onNextAsyncAction =
      AsyncAction('_NumberInputScreenStore.onNext', context: context);

  @override
  Future onNext() {
    return _$onNextAsyncAction.run(() => super.onNext());
  }

  late final _$validateInputAsyncAction =
      AsyncAction('_NumberInputScreenStore.validateInput', context: context);

  @override
  Future validateInput() {
    return _$validateInputAsyncAction.run(() => super.validateInput());
  }

  late final _$_NumberInputScreenStoreActionController =
      ActionController(name: '_NumberInputScreenStore', context: context);

  @override
  dynamic onNumberClear() {
    final _$actionInfo = _$_NumberInputScreenStoreActionController.startAction(
        name: '_NumberInputScreenStore.onNumberClear');
    try {
      return super.onNumberClear();
    } finally {
      _$_NumberInputScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNumberChange(String number) {
    final _$actionInfo = _$_NumberInputScreenStoreActionController.startAction(
        name: '_NumberInputScreenStore.onNumberChange');
    try {
      return super.onNumberChange(number);
    } finally {
      _$_NumberInputScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingDataLoader: ${gettingDataLoader},
sendingLoader: ${sendingLoader},
codes: ${codes},
mobileNumber: ${mobileNumber},
enableBtn: ${enableBtn}
    ''';
  }
}
