// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashStore on _SplashScreenStore, Store {
  late final _$connectivityStateAtom =
      Atom(name: '_SplashScreenStore.connectivityState', context: context);

  @override
  ConnectivityState get connectivityState {
    _$connectivityStateAtom.reportRead();
    return super.connectivityState;
  }

  @override
  set connectivityState(ConnectivityState value) {
    _$connectivityStateAtom.reportWrite(value, super.connectivityState, () {
      super.connectivityState = value;
    });
  }

  late final _$packageInfoAtom =
      Atom(name: '_SplashScreenStore.packageInfo', context: context);

  @override
  PackageInfo get packageInfo {
    _$packageInfoAtom.reportRead();
    return super.packageInfo;
  }

  @override
  set packageInfo(PackageInfo value) {
    _$packageInfoAtom.reportWrite(value, super.packageInfo, () {
      super.packageInfo = value;
    });
  }

  late final _$batchCallAtom =
      Atom(name: '_SplashScreenStore.batchCall', context: context);

  @override
  BatchCallCommand get batchCall {
    _$batchCallAtom.reportRead();
    return super.batchCall;
  }

  @override
  set batchCall(BatchCallCommand value) {
    _$batchCallAtom.reportWrite(value, super.batchCall, () {
      super.batchCall = value;
    });
  }

  late final _$_initPackageInfoAsyncAction =
      AsyncAction('_SplashScreenStore._initPackageInfo', context: context);

  @override
  Future _initPackageInfo() {
    return _$_initPackageInfoAsyncAction.run(() => super._initPackageInfo());
  }

  late final _$_getBaseUrlAsyncAction =
      AsyncAction('_SplashScreenStore._getBaseUrl', context: context);

  @override
  Future _getBaseUrl() {
    return _$_getBaseUrlAsyncAction.run(() => super._getBaseUrl());
  }

  late final _$_checkAppVersionAsyncAction =
      AsyncAction('_SplashScreenStore._checkAppVersion', context: context);

  @override
  Future _checkAppVersion() {
    return _$_checkAppVersionAsyncAction.run(() => super._checkAppVersion());
  }

  late final _$_SplashScreenStoreActionController =
      ActionController(name: '_SplashScreenStore', context: context);

  @override
  dynamic _changeConnectivity(ConnectivityState connectivityState) {
    final _$actionInfo = _$_SplashScreenStoreActionController.startAction(
        name: '_SplashScreenStore._changeConnectivity');
    try {
      return super._changeConnectivity(connectivityState);
    } finally {
      _$_SplashScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityState: ${connectivityState},
packageInfo: ${packageInfo},
batchCall: ${batchCall}
    ''';
  }
}
