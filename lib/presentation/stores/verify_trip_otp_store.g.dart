// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_trip_otp_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VerifyTripOtpStore on _IVerifyTripOtpStore, Store {
  late final _$enableBtnAtom =
      Atom(name: '_IVerifyTripOtpStore.enableBtn', context: context);

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
      Atom(name: '_IVerifyTripOtpStore.sendingLoader', context: context);

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

  late final _$reSendingOtpLoaderAtom =
      Atom(name: '_IVerifyTripOtpStore.reSendingOtpLoader', context: context);

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

  late final _$reSendOtpAsyncAction =
      AsyncAction('_IVerifyTripOtpStore.reSendOtp', context: context);

  @override
  Future reSendOtp() {
    return _$reSendOtpAsyncAction.run(() => super.reSendOtp());
  }

  late final _$verifyAsyncAction =
      AsyncAction('_IVerifyTripOtpStore.verify', context: context);

  @override
  Future verify() {
    return _$verifyAsyncAction.run(() => super.verify());
  }

  late final _$_IVerifyTripOtpStoreActionController =
      ActionController(name: '_IVerifyTripOtpStore', context: context);

  @override
  dynamic otpEntered(String enteredOtp) {
    final _$actionInfo = _$_IVerifyTripOtpStoreActionController.startAction(
        name: '_IVerifyTripOtpStore.otpEntered');
    try {
      return super.otpEntered(enteredOtp);
    } finally {
      _$_IVerifyTripOtpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateOtp(String? otp) {
    final _$actionInfo = _$_IVerifyTripOtpStoreActionController.startAction(
        name: '_IVerifyTripOtpStore.validateOtp');
    try {
      return super.validateOtp(otp);
    } finally {
      _$_IVerifyTripOtpStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
enableBtn: ${enableBtn},
sendingLoader: ${sendingLoader},
reSendingOtpLoader: ${reSendingOtpLoader}
    ''';
  }
}
