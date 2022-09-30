// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_policy_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrivacyPolicyStore on _PrivacyPolicyViewModel, Store {
  late final _$isLoaderAtom =
      Atom(name: '_PrivacyPolicyViewModel.isLoader', context: context);

  @override
  bool get isLoader {
    _$isLoaderAtom.reportRead();
    return super.isLoader;
  }

  @override
  set isLoader(bool value) {
    _$isLoaderAtom.reportWrite(value, super.isLoader, () {
      super.isLoader = value;
    });
  }

  late final _$privacyPolicyTxtAtom =
      Atom(name: '_PrivacyPolicyViewModel.privacyPolicyTxt', context: context);

  @override
  String get privacyPolicyTxt {
    _$privacyPolicyTxtAtom.reportRead();
    return super.privacyPolicyTxt;
  }

  @override
  set privacyPolicyTxt(String value) {
    _$privacyPolicyTxtAtom.reportWrite(value, super.privacyPolicyTxt, () {
      super.privacyPolicyTxt = value;
    });
  }

  late final _$msgAtom =
      Atom(name: '_PrivacyPolicyViewModel.msg', context: context);

  @override
  String get msg {
    _$msgAtom.reportRead();
    return super.msg;
  }

  @override
  set msg(String value) {
    _$msgAtom.reportWrite(value, super.msg, () {
      super.msg = value;
    });
  }

  late final _$_initialDataAsyncAction =
      AsyncAction('_PrivacyPolicyViewModel._initialData', context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  @override
  String toString() {
    return '''
isLoader: ${isLoader},
privacyPolicyTxt: ${privacyPolicyTxt},
msg: ${msg}
    ''';
  }
}
