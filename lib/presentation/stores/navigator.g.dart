// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigator.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppNavigator on _Navigator, Store {
  Computed<ScreenWithExtras?>? _$currentChangeComputed;

  @override
  ScreenWithExtras? get currentChange => (_$currentChangeComputed ??=
          Computed<ScreenWithExtras?>(() => super.currentChange,
              name: '_Navigator.currentChange'))
      .value;

  late final _$_changeAtom = Atom(name: '_Navigator._change', context: context);

  @override
  ScreenWithExtras? get _change {
    _$_changeAtom.reportRead();
    return super._change;
  }

  @override
  set _change(ScreenWithExtras? value) {
    _$_changeAtom.reportWrite(value, super._change, () {
      super._change = value;
    });
  }

  late final _$_NavigatorActionController =
      ActionController(name: '_Navigator', context: context);

  @override
  dynamic onChange(ScreenWithExtras data) {
    final _$actionInfo =
        _$_NavigatorActionController.startAction(name: '_Navigator.onChange');
    try {
      return super.onChange(data);
    } finally {
      _$_NavigatorActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo =
        _$_NavigatorActionController.startAction(name: '_Navigator.clear');
    try {
      return super.clear();
    } finally {
      _$_NavigatorActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentChange: ${currentChange}
    ''';
  }
}
