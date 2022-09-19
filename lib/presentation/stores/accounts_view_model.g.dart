// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccountsStore on _AccountsViewModels, Store {
  late final _$isLoadingAtom =
      Atom(name: '_AccountsViewModels.isLoading', context: context);

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

  late final _$balanceLowAtom =
      Atom(name: '_AccountsViewModels.balanceLow', context: context);

  @override
  String get balanceLow {
    _$balanceLowAtom.reportRead();
    return super.balanceLow;
  }

  @override
  set balanceLow(String value) {
    _$balanceLowAtom.reportWrite(value, super.balanceLow, () {
      super.balanceLow = value;
    });
  }

  late final _$onlinePriceAtom =
      Atom(name: '_AccountsViewModels.onlinePrice', context: context);

  @override
  String get onlinePrice {
    _$onlinePriceAtom.reportRead();
    return super.onlinePrice;
  }

  @override
  set onlinePrice(String value) {
    _$onlinePriceAtom.reportWrite(value, super.onlinePrice, () {
      super.onlinePrice = value;
    });
  }

  late final _$cashPriceAtom =
      Atom(name: '_AccountsViewModels.cashPrice', context: context);

  @override
  String get cashPrice {
    _$cashPriceAtom.reportRead();
    return super.cashPrice;
  }

  @override
  set cashPrice(String value) {
    _$cashPriceAtom.reportWrite(value, super.cashPrice, () {
      super.cashPrice = value;
    });
  }

  late final _$currentBalanceAtom =
      Atom(name: '_AccountsViewModels.currentBalance', context: context);

  @override
  String get currentBalance {
    _$currentBalanceAtom.reportRead();
    return super.currentBalance;
  }

  @override
  set currentBalance(String value) {
    _$currentBalanceAtom.reportWrite(value, super.currentBalance, () {
      super.currentBalance = value;
    });
  }

  late final _$getAcctountSummeryDataAsyncAction = AsyncAction(
      '_AccountsViewModels.getAcctountSummeryData',
      context: context);

  @override
  Future getAcctountSummeryData() {
    return _$getAcctountSummeryDataAsyncAction
        .run(() => super.getAcctountSummeryData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
balanceLow: ${balanceLow},
onlinePrice: ${onlinePrice},
cashPrice: ${cashPrice},
currentBalance: ${currentBalance}
    ''';
  }
}
