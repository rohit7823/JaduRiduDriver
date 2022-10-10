// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScheduleStore on _ScheduleViewModel, Store {
  late final _$scheduleArrayListAtom =
      Atom(name: '_ScheduleViewModel.scheduleArrayList', context: context);

  @override
  List<LocationSchedule> get scheduleArrayList {
    _$scheduleArrayListAtom.reportRead();
    return super.scheduleArrayList;
  }

  @override
  set scheduleArrayList(List<LocationSchedule> value) {
    _$scheduleArrayListAtom.reportWrite(value, super.scheduleArrayList, () {
      super.scheduleArrayList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ScheduleViewModel.isLoading', context: context);

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
      Atom(name: '_ScheduleViewModel.isEmpty', context: context);

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

  late final _$msgAtom = Atom(name: '_ScheduleViewModel.msg', context: context);

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

  late final _$schedulelistItemAsyncAction =
      AsyncAction('_ScheduleViewModel.schedulelistItem', context: context);

  @override
  Future schedulelistItem() {
    return _$schedulelistItemAsyncAction.run(() => super.schedulelistItem());
  }

  @override
  String toString() {
    return '''
scheduleArrayList: ${scheduleArrayList},
isLoading: ${isLoading},
isEmpty: ${isEmpty},
msg: ${msg}
    ''';
  }
}
