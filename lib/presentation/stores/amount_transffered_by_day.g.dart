// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amount_transffered_by_day.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AmountTransfferedByDayStore on _AmountTransfferedByDays, Store {
  late final _$amountTransferredListAtom = Atom(
      name: '_AmountTransfferedByDays.amountTransferredList', context: context);

  @override
  List<AmountTransferredByDayResponseClass> get amountTransferredList {
    _$amountTransferredListAtom.reportRead();
    return super.amountTransferredList;
  }

  @override
  set amountTransferredList(List<AmountTransferredByDayResponseClass> value) {
    _$amountTransferredListAtom.reportWrite(value, super.amountTransferredList,
        () {
      super.amountTransferredList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_AmountTransfferedByDays.isLoading', context: context);

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
      Atom(name: '_AmountTransfferedByDays.isEmpty', context: context);

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
      Atom(name: '_AmountTransfferedByDays.msg', context: context);

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

  late final _$amountTransferredListItemAsyncAction = AsyncAction(
      '_AmountTransfferedByDays.amountTransferredListItem',
      context: context);

  @override
  Future amountTransferredListItem() {
    return _$amountTransferredListItemAsyncAction
        .run(() => super.amountTransferredListItem());
  }

  @override
  String toString() {
    return '''
amountTransferredList: ${amountTransferredList},
isLoading: ${isLoading},
isEmpty: ${isEmpty},
msg: ${msg}
    ''';
  }
}
