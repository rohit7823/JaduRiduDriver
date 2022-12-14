// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_informer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MessageInformer on _IMessageInformer, Store {
  Computed<String>? _$currentLabelComputed;

  @override
  String get currentLabel =>
      (_$currentLabelComputed ??= Computed<String>(() => super.currentLabel,
              name: '_IMessageInformer.currentLabel'))
          .value;
  Computed<String>? _$currentMsgComputed;

  @override
  String get currentMsg =>
      (_$currentMsgComputed ??= Computed<String>(() => super.currentMsg,
              name: '_IMessageInformer.currentMsg'))
          .value;

  late final _$_messageAtom =
      Atom(name: '_IMessageInformer._message', context: context);

  @override
  String get _message {
    _$_messageAtom.reportRead();
    return super._message;
  }

  @override
  set _message(String value) {
    _$_messageAtom.reportWrite(value, super._message, () {
      super._message = value;
    });
  }

  late final _$_labelAtom =
      Atom(name: '_IMessageInformer._label', context: context);

  @override
  String get _label {
    _$_labelAtom.reportRead();
    return super._label;
  }

  @override
  set _label(String value) {
    _$_labelAtom.reportWrite(value, super._label, () {
      super._label = value;
    });
  }

  late final _$_IMessageInformerActionController =
      ActionController(name: '_IMessageInformer', context: context);

  @override
  dynamic informUi(String msg) {
    final _$actionInfo = _$_IMessageInformerActionController.startAction(
        name: '_IMessageInformer.informUi');
    try {
      return super.informUi(msg);
    } finally {
      _$_IMessageInformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateLabel(String msg) {
    final _$actionInfo = _$_IMessageInformerActionController.startAction(
        name: '_IMessageInformer.updateLabel');
    try {
      return super.updateLabel(msg);
    } finally {
      _$_IMessageInformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearLabel() {
    final _$actionInfo = _$_IMessageInformerActionController.startAction(
        name: '_IMessageInformer.clearLabel');
    try {
      return super.clearLabel();
    } finally {
      _$_IMessageInformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$_IMessageInformerActionController.startAction(
        name: '_IMessageInformer.clear');
    try {
      return super.clear();
    } finally {
      _$_IMessageInformerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLabel: ${currentLabel},
currentMsg: ${currentMsg}
    ''';
  }
}
