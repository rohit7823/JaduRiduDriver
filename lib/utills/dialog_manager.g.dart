// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialog_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DialogManager on _DialogManager, Store {
  Computed<DialogState>? _$currentStateComputed;

  @override
  DialogState get currentState => (_$currentStateComputed ??=
          Computed<DialogState>(() => super.currentState,
              name: '_DialogManager.currentState'))
      .value;
  Computed<DialogState>? _$currentErrorStateComputed;

  @override
  DialogState get currentErrorState => (_$currentErrorStateComputed ??=
          Computed<DialogState>(() => super.currentErrorState,
              name: '_DialogManager.currentErrorState'))
      .value;

  late final _$_stateAtom =
      Atom(name: '_DialogManager._state', context: context);

  @override
  DialogState get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(DialogState value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$_errorStateAtom =
      Atom(name: '_DialogManager._errorState', context: context);

  @override
  DialogState get _errorState {
    _$_errorStateAtom.reportRead();
    return super._errorState;
  }

  @override
  set _errorState(DialogState value) {
    _$_errorStateAtom.reportWrite(value, super._errorState, () {
      super._errorState = value;
    });
  }

  late final _$dataAtom = Atom(name: '_DialogManager.data', context: context);

  @override
  AlertData<dynamic>? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(AlertData<dynamic>? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$errorDataAtom =
      Atom(name: '_DialogManager.errorData', context: context);

  @override
  AlertData<dynamic>? get errorData {
    _$errorDataAtom.reportRead();
    return super.errorData;
  }

  @override
  set errorData(AlertData<dynamic>? value) {
    _$errorDataAtom.reportWrite(value, super.errorData, () {
      super.errorData = value;
    });
  }

  late final _$_DialogManagerActionController =
      ActionController(name: '_DialogManager', context: context);

  @override
  dynamic initData(AlertData<dynamic> alertData,
      {DialogState state = DialogState.displaying}) {
    final _$actionInfo = _$_DialogManagerActionController.startAction(
        name: '_DialogManager.initData');
    try {
      return super.initData(alertData, state: state);
    } finally {
      _$_DialogManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initErrorData(AlertData<dynamic> alertData,
      {DialogState errorState = DialogState.displaying}) {
    final _$actionInfo = _$_DialogManagerActionController.startAction(
        name: '_DialogManager.initErrorData');
    try {
      return super.initErrorData(alertData, errorState: errorState);
    } finally {
      _$_DialogManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeDialog() {
    final _$actionInfo = _$_DialogManagerActionController.startAction(
        name: '_DialogManager.closeDialog');
    try {
      return super.closeDialog();
    } finally {
      _$_DialogManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic closeErrorDialog() {
    final _$actionInfo = _$_DialogManagerActionController.startAction(
        name: '_DialogManager.closeErrorDialog');
    try {
      return super.closeErrorDialog();
    } finally {
      _$_DialogManagerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
errorData: ${errorData},
currentState: ${currentState},
currentErrorState: ${currentErrorState}
    ''';
  }
}
