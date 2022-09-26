// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileViewModel on _Profile, Store {
  late final _$isLoadingAtom =
      Atom(name: '_Profile.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$driverNameAtom =
      Atom(name: '_Profile.driverName', context: context);

  @override
  String get driverName {
    _$driverNameAtom.reportRead();
    return super.driverName;
  }

  @override
  set driverName(String value) {
    _$driverNameAtom.reportWrite(value, super.driverName, () {
      super.driverName = value;
    });
  }

  late final _$imageURLAtom = Atom(name: '_Profile.imageURL', context: context);

  @override
  String get imageURL {
    _$imageURLAtom.reportRead();
    return super.imageURL;
  }

  @override
  set imageURL(String value) {
    _$imageURLAtom.reportWrite(value, super.imageURL, () {
      super.imageURL = value;
    });
  }

  late final _$getShortProfileDataAsyncAction =
      AsyncAction('_Profile.getShortProfileData', context: context);

  @override
  Future getShortProfileData() {
    return _$getShortProfileDataAsyncAction
        .run(() => super.getShortProfileData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
driverName: ${driverName},
imageURL: ${imageURL}
    ''';
  }
}
