// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identify_question_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IdentifyQuestionItem on _IdentifyQuestionItemModel, Store {
  Computed<bool>? _$loadingStatusComputed;

  @override
  bool get loadingStatus =>
      (_$loadingStatusComputed ??= Computed<bool>(() => super.loadingStatus,
              name: '_IdentifyQuestionItemModel.loadingStatus'))
          .value;
  Computed<QuestionOption>? _$selectedOptionComputed;

  @override
  QuestionOption get selectedOption => (_$selectedOptionComputed ??=
          Computed<QuestionOption>(() => super.selectedOption,
              name: '_IdentifyQuestionItemModel.selectedOption'))
      .value;

  late final _$_loadingAtom =
      Atom(name: '_IdentifyQuestionItemModel._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_optionAtom =
      Atom(name: '_IdentifyQuestionItemModel._option', context: context);

  @override
  QuestionOption get _option {
    _$_optionAtom.reportRead();
    return super._option;
  }

  @override
  set _option(QuestionOption value) {
    _$_optionAtom.reportWrite(value, super._option, () {
      super._option = value;
    });
  }

  late final _$_IdentifyQuestionItemModelActionController =
      ActionController(name: '_IdentifyQuestionItemModel', context: context);

  @override
  dynamic selectOption(QuestionOption option) {
    final _$actionInfo = _$_IdentifyQuestionItemModelActionController
        .startAction(name: '_IdentifyQuestionItemModel.selectOption');
    try {
      return super.selectOption(option);
    } finally {
      _$_IdentifyQuestionItemModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLoading(bool loading) {
    final _$actionInfo = _$_IdentifyQuestionItemModelActionController
        .startAction(name: '_IdentifyQuestionItemModel.changeLoading');
    try {
      return super.changeLoading(loading);
    } finally {
      _$_IdentifyQuestionItemModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingStatus: ${loadingStatus},
selectedOption: ${selectedOption}
    ''';
  }
}
