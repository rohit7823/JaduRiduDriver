// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_payment_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodaysPaymentss on _TodaysPaymentViewModel, Store {
  late final _$todaysPaymentListAtom =
      Atom(name: '_TodaysPaymentViewModel.todaysPaymentList', context: context);

  @override
  List<TodayPaymentHistory> get todaysPaymentList {
    _$todaysPaymentListAtom.reportRead();
    return super.todaysPaymentList;
  }

  @override
  set todaysPaymentList(List<TodayPaymentHistory> value) {
    _$todaysPaymentListAtom.reportWrite(value, super.todaysPaymentList, () {
      super.todaysPaymentList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TodaysPaymentViewModel.isLoading', context: context);

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

  late final _$todaysPaymentListItemAsyncAction = AsyncAction(
      '_TodaysPaymentViewModel.todaysPaymentListItem',
      context: context);

  @override
  Future todaysPaymentListItem() {
    return _$todaysPaymentListItemAsyncAction
        .run(() => super.todaysPaymentListItem());
  }

  @override
  String toString() {
    return '''
todaysPaymentList: ${todaysPaymentList},
isLoading: ${isLoading}
    ''';
  }
}
