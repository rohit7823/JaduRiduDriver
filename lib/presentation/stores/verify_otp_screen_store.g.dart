// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerifyOtpStore on _VerifyOtpScreenStore, Store {
  late final _$reSendingOtpLoaderAtom =
      Atom(name: '_VerifyOtpScreenStore.reSendingOtpLoader', context: context);

  @override
  bool get reSendingOtpLoader {
    _$reSendingOtpLoaderAtom.reportRead();
    return super.reSendingOtpLoader;
  }

  @override
  set reSendingOtpLoader(bool value) {
    _$reSendingOtpLoaderAtom.reportWrite(value, super.reSendingOtpLoader, () {
      super.reSendingOtpLoader = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_VerifyOtpScreenStore.enableBtn', context: context);

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

  late final _$sendingLoaderAtom =
      Atom(name: '_VerifyOtpScreenStore.sendingLoader', context: context);

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

  late final _$showSnackbarMsgAtom =
      Atom(name: '_VerifyOtpScreenStore.showSnackbarMsg', context: context);

  @override
  String get showSnackbarMsg {
    _$showSnackbarMsgAtom.reportRead();
    return super.showSnackbarMsg;
  }

  @override
  set showSnackbarMsg(String value) {
    _$showSnackbarMsgAtom.reportWrite(value, super.showSnackbarMsg, () {
      super.showSnackbarMsg = value;
    });
  }

  late final _$isUserRegisterAtom =
      Atom(name: '_VerifyOtpScreenStore.isUserRegister', context: context);

  @override
  bool get isUserRegister {
    _$isUserRegisterAtom.reportRead();
    return super.isUserRegister;
  }

  @override
  set isUserRegister(bool value) {
    _$isUserRegisterAtom.reportWrite(value, super.isUserRegister, () {
      super.isUserRegister = value;
    });
  }

  late final _$reSendOtpAsyncAction =
      AsyncAction('_VerifyOtpScreenStore.reSendOtp', context: context);

  @override
  Future reSendOtp() {
    return _$reSendOtpAsyncAction.run(() => super.reSendOtp());
  }

  late final _$verifyAsyncAction =
      AsyncAction('_VerifyOtpScreenStore.verify', context: context);

  @override
  Future verify() {
    return _$verifyAsyncAction.run(() => super.verify());
  }

  late final _$_retrieveDriverAccountStatusAsyncAction = AsyncAction(
      '_VerifyOtpScreenStore._retrieveDriverAccountStatus',
      context: context);

  @override
  Future _retrieveDriverAccountStatus(
      {required Function success, required Function error}) {
    return _$_retrieveDriverAccountStatusAsyncAction.run(() =>
        super._retrieveDriverAccountStatus(success: success, error: error));
  }

  late final _$_VerifyOtpScreenStoreActionController =
      ActionController(name: '_VerifyOtpScreenStore', context: context);

  @override
  dynamic otpEntered(String enteredOtp) {
    final _$actionInfo = _$_VerifyOtpScreenStoreActionController.startAction(
        name: '_VerifyOtpScreenStore.otpEntered');
    try {
      return super.otpEntered(enteredOtp);
    } finally {
      _$_VerifyOtpScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateOtp(String? otp) {
    final _$actionInfo = _$_VerifyOtpScreenStoreActionController.startAction(
        name: '_VerifyOtpScreenStore.validateOtp');
    try {
      return super.validateOtp(otp);
    } finally {
      _$_VerifyOtpScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearUserRegister() {
    final _$actionInfo = _$_VerifyOtpScreenStoreActionController.startAction(
        name: '_VerifyOtpScreenStore.clearUserRegister');
    try {
      return super.clearUserRegister();
    } finally {
      _$_VerifyOtpScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reSendingOtpLoader: ${reSendingOtpLoader},
enableBtn: ${enableBtn},
sendingLoader: ${sendingLoader},
showSnackbarMsg: ${showSnackbarMsg},
isUserRegister: ${isUserRegister}
    ''';
  }
}
