// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TermsAndConditionsStore on _TermsAndConditionsViewModel, Store {
  late final _$isLoaderAtom =
      Atom(name: '_TermsAndConditionsViewModel.isLoader', context: context);

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

  late final _$conditionsTxtAtom = Atom(
      name: '_TermsAndConditionsViewModel.conditionsTxt', context: context);

  @override
  String get conditionsTxt {
    _$conditionsTxtAtom.reportRead();
    return super.conditionsTxt;
  }

  @override
  set conditionsTxt(String value) {
    _$conditionsTxtAtom.reportWrite(value, super.conditionsTxt, () {
      super.conditionsTxt = value;
    });
  }

  late final _$msgAtom =
      Atom(name: '_TermsAndConditionsViewModel.msg', context: context);

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

  late final _$_initialDataAsyncAction = AsyncAction(
      '_TermsAndConditionsViewModel._initialData',
      context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  @override
  String toString() {
    return '''
isLoader: ${isLoader},
conditionsTxt: ${conditionsTxt},
msg: ${msg}
    ''';
  }
}
