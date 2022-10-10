// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_support_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmergencyStore on _EmergencySupportViewModel, Store {
  late final _$isLoaderAtom =
      Atom(name: '_EmergencySupportViewModel.isLoader', context: context);

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

  late final _$msgAtom =
      Atom(name: '_EmergencySupportViewModel.msg', context: context);

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

  late final _$helpPhoneNumberAtom = Atom(
      name: '_EmergencySupportViewModel.helpPhoneNumber', context: context);

  @override
  String get helpPhoneNumber {
    _$helpPhoneNumberAtom.reportRead();
    return super.helpPhoneNumber;
  }

  @override
  set helpPhoneNumber(String value) {
    _$helpPhoneNumberAtom.reportWrite(value, super.helpPhoneNumber, () {
      super.helpPhoneNumber = value;
    });
  }

  late final _$_initialDataAsyncAction =
      AsyncAction('_EmergencySupportViewModel._initialData', context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  @override
  String toString() {
    return '''
isLoader: ${isLoader},
msg: ${msg},
helpPhoneNumber: ${helpPhoneNumber}
    ''';
  }
}
