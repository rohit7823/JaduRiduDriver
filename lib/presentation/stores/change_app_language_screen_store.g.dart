// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_app_language_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangeAppLanguageStore on _ChangeAppLanguageScreenStore, Store {
  late final _$selectedAppLocaleAtom = Atom(
      name: '_ChangeAppLanguageScreenStore.selectedAppLocale',
      context: context);

  @override
  AppLanguageCode get selectedAppLocale {
    _$selectedAppLocaleAtom.reportRead();
    return super.selectedAppLocale;
  }

  @override
  set selectedAppLocale(AppLanguageCode value) {
    _$selectedAppLocaleAtom.reportWrite(value, super.selectedAppLocale, () {
      super.selectedAppLocale = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_ChangeAppLanguageScreenStore.enableBtn', context: context);

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

  late final _$sendingLoaderAtom = Atom(
      name: '_ChangeAppLanguageScreenStore.sendingLoader', context: context);

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

  late final _$languageChangedMsgAtom = Atom(
      name: '_ChangeAppLanguageScreenStore.languageChangedMsg',
      context: context);

  @override
  String get languageChangedMsg {
    _$languageChangedMsgAtom.reportRead();
    return super.languageChangedMsg;
  }

  @override
  set languageChangedMsg(String value) {
    _$languageChangedMsgAtom.reportWrite(value, super.languageChangedMsg, () {
      super.languageChangedMsg = value;
    });
  }

  late final _$onNextAsyncAction =
      AsyncAction('_ChangeAppLanguageScreenStore.onNext', context: context);

  @override
  Future onNext({required Function changeLang}) {
    return _$onNextAsyncAction.run(() => super.onNext(changeLang: changeLang));
  }

  late final _$_ChangeAppLanguageScreenStoreActionController =
      ActionController(name: '_ChangeAppLanguageScreenStore', context: context);

  @override
  void setCurrentLocale(BuildContext context) {
    final _$actionInfo = _$_ChangeAppLanguageScreenStoreActionController
        .startAction(name: '_ChangeAppLanguageScreenStore.setCurrentLocale');
    try {
      return super.setCurrentLocale(context);
    } finally {
      _$_ChangeAppLanguageScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onLocaleClick(AppLanguageCode selected) {
    final _$actionInfo = _$_ChangeAppLanguageScreenStoreActionController
        .startAction(name: '_ChangeAppLanguageScreenStore.onLocaleClick');
    try {
      return super.onLocaleClick(selected);
    } finally {
      _$_ChangeAppLanguageScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedAppLocale: ${selectedAppLocale},
enableBtn: ${enableBtn},
sendingLoader: ${sendingLoader},
languageChangedMsg: ${languageChangedMsg}
    ''';
  }
}
