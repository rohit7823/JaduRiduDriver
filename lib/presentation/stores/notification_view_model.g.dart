// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on _NotificationViewModels, Store {
  late final _$NListAtom =
      Atom(name: '_NotificationViewModels.NList', context: context);

  @override
  List<NotificationResponseClass> get NList {
    _$NListAtom.reportRead();
    return super.NList;
  }

  @override
  set NList(List<NotificationResponseClass> value) {
    _$NListAtom.reportWrite(value, super.NList, () {
      super.NList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_NotificationViewModels.isLoading', context: context);

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

  late final _$isEmptyAtom =
      Atom(name: '_NotificationViewModels.isEmpty', context: context);

  @override
  bool get isEmpty {
    _$isEmptyAtom.reportRead();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    _$isEmptyAtom.reportWrite(value, super.isEmpty, () {
      super.isEmpty = value;
    });
  }

  late final _$msgAtom =
      Atom(name: '_NotificationViewModels.msg', context: context);

  @override
  String get msg {
    _$msgAtom.reportRead();
    return super.msg;
  }

  @override
  set msg(String value) {
    _$msgAtom.reportWrite(value, super.msg, () {
      super.msg = value;
    });
  }

  late final _$getNotificationDataAsyncAction = AsyncAction(
      '_NotificationViewModels.getNotificationData',
      context: context);

  @override
  Future getNotificationData() {
    return _$getNotificationDataAsyncAction
        .run(() => super.getNotificationData());
  }

  @override
  String toString() {
    return '''
NList: ${NList},
isLoading: ${isLoading},
isEmpty: ${isEmpty},
msg: ${msg}
    ''';
  }
}
