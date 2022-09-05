// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Uploader on _Uploader, Store {
  Computed<bool>? _$statusComputed;

  @override
  bool get status => (_$statusComputed ??=
          Computed<bool>(() => super.status, name: '_Uploader.status'))
      .value;

  late final _$_startAtom = Atom(name: '_Uploader._start', context: context);

  @override
  bool get _start {
    _$_startAtom.reportRead();
    return super._start;
  }

  @override
  set _start(bool value) {
    _$_startAtom.reportWrite(value, super._start, () {
      super._start = value;
    });
  }

  late final _$_UploaderActionController =
      ActionController(name: '_Uploader', context: context);

  @override
  dynamic start(int sent, int total) {
    final _$actionInfo =
        _$_UploaderActionController.startAction(name: '_Uploader.start');
    try {
      return super.start(sent, total);
    } finally {
      _$_UploaderActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startUploader(int total) {
    final _$actionInfo = _$_UploaderActionController.startAction(
        name: '_Uploader.startUploader');
    try {
      return super.startUploader(total);
    } finally {
      _$_UploaderActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stopUploader(int size) {
    final _$actionInfo =
        _$_UploaderActionController.startAction(name: '_Uploader.stopUploader');
    try {
      return super.stopUploader(size);
    } finally {
      _$_UploaderActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
