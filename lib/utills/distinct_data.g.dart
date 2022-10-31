// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distinct_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DistinctData<T> on _IDistinctData<T>, Store {
  late final _$dataAtom = Atom(name: '_IDistinctData.data', context: context);

  @override
  T? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(T? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$_IDistinctDataActionController =
      ActionController(name: '_IDistinctData', context: context);

  @override
  dynamic init(T data, {required bool Function(T, T) test}) {
    final _$actionInfo = _$_IDistinctDataActionController.startAction(
        name: '_IDistinctData.init');
    try {
      return super.init(data, test: test);
    } finally {
      _$_IDistinctDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clear() {
    final _$actionInfo = _$_IDistinctDataActionController.startAction(
        name: '_IDistinctData.clear');
    try {
      return super.clear();
    } finally {
      _$_IDistinctDataActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data}
    ''';
  }
}
