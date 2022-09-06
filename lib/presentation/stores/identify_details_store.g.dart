// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identify_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IdentifyDetailStore on _IdentifyDetailsStore, Store {
  late final _$gettingDataLoaderAtom =
      Atom(name: '_IdentifyDetailsStore.gettingDataLoader', context: context);

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

  late final _$questionItemsAtom =
      Atom(name: '_IdentifyDetailsStore.questionItems', context: context);

  @override
  List<IdentifyQuestionItem> get questionItems {
    _$questionItemsAtom.reportRead();
    return super.questionItems;
  }

  @override
  set questionItems(List<IdentifyQuestionItem> value) {
    _$questionItemsAtom.reportWrite(value, super.questionItems, () {
      super.questionItems = value;
    });
  }

  late final _$informMessageAtom =
      Atom(name: '_IdentifyDetailsStore.informMessage', context: context);

  @override
  String get informMessage {
    _$informMessageAtom.reportRead();
    return super.informMessage;
  }

  @override
  set informMessage(String value) {
    _$informMessageAtom.reportWrite(value, super.informMessage, () {
      super.informMessage = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_IdentifyDetailsStore.enableBtn', context: context);

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

  late final _$onChangeLoaderAtom =
      Atom(name: '_IdentifyDetailsStore.onChangeLoader', context: context);

  @override
  bool get onChangeLoader {
    _$onChangeLoaderAtom.reportRead();
    return super.onChangeLoader;
  }

  @override
  set onChangeLoader(bool value) {
    _$onChangeLoaderAtom.reportWrite(value, super.onChangeLoader, () {
      super.onChangeLoader = value;
    });
  }

  late final _$_validateAsyncAction =
      AsyncAction('_IdentifyDetailsStore._validate', context: context);

  @override
  Future _validate() {
    return _$_validateAsyncAction.run(() => super._validate());
  }

  late final _$_getQuestionsAsyncAction =
      AsyncAction('_IdentifyDetailsStore._getQuestions', context: context);

  @override
  Future _getQuestions() {
    return _$_getQuestionsAsyncAction.run(() => super._getQuestions());
  }

  late final _$onSelectQuestionAsyncAction =
      AsyncAction('_IdentifyDetailsStore.onSelectQuestion', context: context);

  @override
  Future onSelectQuestion(QuestionOption? option, int idx) {
    return _$onSelectQuestionAsyncAction
        .run(() => super.onSelectQuestion(option, idx));
  }

  late final _$onSaveAsyncAction =
      AsyncAction('_IdentifyDetailsStore.onSave', context: context);

  @override
  Future onSave() {
    return _$onSaveAsyncAction.run(() => super.onSave());
  }

  @override
  String toString() {
    return '''
gettingDataLoader: ${gettingDataLoader},
questionItems: ${questionItems},
informMessage: ${informMessage},
enableBtn: ${enableBtn},
onChangeLoader: ${onChangeLoader}
    ''';
  }
}
