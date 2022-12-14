// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_balance_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentBalanceStore on _CurrentBalanceViewModel, Store {
  late final _$currentBalanceHistoryAtom = Atom(
      name: '_CurrentBalanceViewModel.currentBalanceHistory', context: context);

  @override
  List<Datum> get currentBalanceHistory {
    _$currentBalanceHistoryAtom.reportRead();
    return super.currentBalanceHistory;
  }

  @override
  set currentBalanceHistory(List<Datum> value) {
    _$currentBalanceHistoryAtom.reportWrite(value, super.currentBalanceHistory,
        () {
      super.currentBalanceHistory = value;
    });
  }

  late final _$selectdAtom =
      Atom(name: '_CurrentBalanceViewModel.selectd', context: context);

  @override
  Package? get selectd {
    _$selectdAtom.reportRead();
    return super.selectd;
  }

  @override
  set selectd(Package? value) {
    _$selectdAtom.reportWrite(value, super.selectd, () {
      super.selectd = value;
    });
  }

  late final _$allDatesListsAtom =
      Atom(name: '_CurrentBalanceViewModel.allDatesLists', context: context);

  @override
  List<Package> get allDatesLists {
    _$allDatesListsAtom.reportRead();
    return super.allDatesLists;
  }

  @override
  set allDatesLists(List<Package> value) {
    _$allDatesListsAtom.reportWrite(value, super.allDatesLists, () {
      super.allDatesLists = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CurrentBalanceViewModel.isLoading', context: context);

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

  late final _$datesSelectedListLoaderAtom = Atom(
      name: '_CurrentBalanceViewModel.datesSelectedListLoader',
      context: context);

  @override
  bool get datesSelectedListLoader {
    _$datesSelectedListLoaderAtom.reportRead();
    return super.datesSelectedListLoader;
  }

  @override
  set datesSelectedListLoader(bool value) {
    _$datesSelectedListLoaderAtom
        .reportWrite(value, super.datesSelectedListLoader, () {
      super.datesSelectedListLoader = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_CurrentBalanceViewModel.date', context: context);

  @override
  String get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(String value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_CurrentBalanceViewModel.selected', context: context);

  @override
  DriverTransactionType get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(DriverTransactionType value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$openingPaymentGatewayLoaderAtom = Atom(
      name: '_CurrentBalanceViewModel.openingPaymentGatewayLoader',
      context: context);

  @override
  bool get openingPaymentGatewayLoader {
    _$openingPaymentGatewayLoaderAtom.reportRead();
    return super.openingPaymentGatewayLoader;
  }

  @override
  set openingPaymentGatewayLoader(bool value) {
    _$openingPaymentGatewayLoaderAtom
        .reportWrite(value, super.openingPaymentGatewayLoader, () {
      super.openingPaymentGatewayLoader = value;
    });
  }

  late final _$gettingWalletDetailsLoaderAtom = Atom(
      name: '_CurrentBalanceViewModel.gettingWalletDetailsLoader',
      context: context);

  @override
  bool get gettingWalletDetailsLoader {
    _$gettingWalletDetailsLoaderAtom.reportRead();
    return super.gettingWalletDetailsLoader;
  }

  @override
  set gettingWalletDetailsLoader(bool value) {
    _$gettingWalletDetailsLoaderAtom
        .reportWrite(value, super.gettingWalletDetailsLoader, () {
      super.gettingWalletDetailsLoader = value;
    });
  }

  late final _$detailsAtom =
      Atom(name: '_CurrentBalanceViewModel.details', context: context);

  @override
  WalletDetails? get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(WalletDetails? value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  late final _$amountAtom =
      Atom(name: '_CurrentBalanceViewModel.amount', context: context);

  @override
  String? get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(String? value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$walletValueAtom =
      Atom(name: '_CurrentBalanceViewModel.walletValue', context: context);

  @override
  String get walletValue {
    _$walletValueAtom.reportRead();
    return super.walletValue;
  }

  @override
  set walletValue(String value) {
    _$walletValueAtom.reportWrite(value, super.walletValue, () {
      super.walletValue = value;
    });
  }

  late final _$updatableAtom =
      Atom(name: '_CurrentBalanceViewModel.updatable', context: context);

  @override
  bool get updatable {
    _$updatableAtom.reportRead();
    return super.updatable;
  }

  @override
  set updatable(bool value) {
    _$updatableAtom.reportWrite(value, super.updatable, () {
      super.updatable = value;
    });
  }

  late final _$RmessageAtom =
      Atom(name: '_CurrentBalanceViewModel.Rmessage', context: context);

  @override
  String get Rmessage {
    _$RmessageAtom.reportRead();
    return super.Rmessage;
  }

  @override
  set Rmessage(String value) {
    _$RmessageAtom.reportWrite(value, super.Rmessage, () {
      super.Rmessage = value;
    });
  }

  late final _$datelistItemAsyncAction =
      AsyncAction('_CurrentBalanceViewModel.datelistItem', context: context);

  @override
  Future datelistItem() {
    return _$datelistItemAsyncAction.run(() => super.datelistItem());
  }

  late final _$retrieveWalletDetailsAsyncAction = AsyncAction(
      '_CurrentBalanceViewModel.retrieveWalletDetails',
      context: context);

  @override
  Future retrieveWalletDetails() {
    return _$retrieveWalletDetailsAsyncAction
        .run(() => super.retrieveWalletDetails());
  }

  late final _$onClickRefillWalletAsyncAction = AsyncAction(
      '_CurrentBalanceViewModel.onClickRefillWallet',
      context: context);

  @override
  Future onClickRefillWallet() {
    return _$onClickRefillWalletAsyncAction
        .run(() => super.onClickRefillWallet());
  }

  late final _$_CurrentBalanceViewModelActionController =
      ActionController(name: '_CurrentBalanceViewModel', context: context);

  @override
  dynamic currentDate() {
    final _$actionInfo = _$_CurrentBalanceViewModelActionController.startAction(
        name: '_CurrentBalanceViewModel.currentDate');
    try {
      return super.currentDate();
    } finally {
      _$_CurrentBalanceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPaymentMethodSelected(String? value) {
    final _$actionInfo = _$_CurrentBalanceViewModelActionController.startAction(
        name: '_CurrentBalanceViewModel.onPaymentMethodSelected');
    try {
      return super.onPaymentMethodSelected(value);
    } finally {
      _$_CurrentBalanceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRadioSelected(DriverTransactionType? selectedValue) {
    final _$actionInfo = _$_CurrentBalanceViewModelActionController.startAction(
        name: '_CurrentBalanceViewModel.onRadioSelected');
    try {
      return super.onRadioSelected(selectedValue);
    } finally {
      _$_CurrentBalanceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? selected) {
    final _$actionInfo = _$_CurrentBalanceViewModelActionController.startAction(
        name: '_CurrentBalanceViewModel.onSelectDate');
    try {
      return super.onSelectDate(selected);
    } finally {
      _$_CurrentBalanceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentBalanceHistory: ${currentBalanceHistory},
selectd: ${selectd},
allDatesLists: ${allDatesLists},
isLoading: ${isLoading},
datesSelectedListLoader: ${datesSelectedListLoader},
date: ${date},
selected: ${selected},
openingPaymentGatewayLoader: ${openingPaymentGatewayLoader},
gettingWalletDetailsLoader: ${gettingWalletDetailsLoader},
details: ${details},
amount: ${amount},
walletValue: ${walletValue},
updatable: ${updatable},
Rmessage: ${Rmessage}
    ''';
  }
}
