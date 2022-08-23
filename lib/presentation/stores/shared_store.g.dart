// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SharedStore on _SharedStore, Store {
  late final _$gettingIntroDataLoaderAtom =
      Atom(name: '_SharedStore.gettingIntroDataLoader', context: context);

  @override
  bool get gettingIntroDataLoader {
    _$gettingIntroDataLoaderAtom.reportRead();
    return super.gettingIntroDataLoader;
  }

  @override
  set gettingIntroDataLoader(bool value) {
    _$gettingIntroDataLoaderAtom
        .reportWrite(value, super.gettingIntroDataLoader, () {
      super.gettingIntroDataLoader = value;
    });
  }

  late final _$callSuccessAtom =
      Atom(name: '_SharedStore.callSuccess', context: context);

  @override
  bool get callSuccess {
    _$callSuccessAtom.reportRead();
    return super.callSuccess;
  }

  @override
  set callSuccess(bool value) {
    _$callSuccessAtom.reportWrite(value, super.callSuccess, () {
      super.callSuccess = value;
    });
  }

  late final _$gettingDataLoaderAtom =
      Atom(name: '_SharedStore.gettingDataLoader', context: context);

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

  late final _$getIntroPageDataAsyncAction =
      AsyncAction('_SharedStore.getIntroPageData', context: context);

  @override
  Future getIntroPageData() {
    return _$getIntroPageDataAsyncAction.run(() => super.getIntroPageData());
  }

  late final _$getLoginRegistrationPageDataAsyncAction = AsyncAction(
      '_SharedStore.getLoginRegistrationPageData',
      context: context);

  @override
  Future getLoginRegistrationPageData() {
    return _$getLoginRegistrationPageDataAsyncAction
        .run(() => super.getLoginRegistrationPageData());
  }

  @override
  String toString() {
    return '''
gettingIntroDataLoader: ${gettingIntroDataLoader},
callSuccess: ${callSuccess},
gettingDataLoader: ${gettingDataLoader}
    ''';
  }
}
