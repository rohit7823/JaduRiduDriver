// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_summery_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentSummaryStores on _PaymentSummeryViewModel, Store {
  late final _$rechargeHistoryAtom =
      Atom(name: '_PaymentSummeryViewModel.rechargeHistory', context: context);

  @override
  List<RechargeHistory> get rechargeHistory {
    _$rechargeHistoryAtom.reportRead();
    return super.rechargeHistory;
  }

  @override
  set rechargeHistory(List<RechargeHistory> value) {
    _$rechargeHistoryAtom.reportWrite(value, super.rechargeHistory, () {
      super.rechargeHistory = value;
    });
  }

  late final _$dataAtom =
      Atom(name: '_PaymentSummeryViewModel.data', context: context);

  @override
  Data get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(Data value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PaymentSummeryViewModel.isLoading', context: context);

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

  late final _$RmessageAtom =
      Atom(name: '_PaymentSummeryViewModel.Rmessage', context: context);

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

  late final _$datesSelectedListLoaderAtom = Atom(
      name: '_PaymentSummeryViewModel.datesSelectedListLoader',
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

  late final _$finalCurrentDateAtom =
      Atom(name: '_PaymentSummeryViewModel.finalCurrentDate', context: context);

  @override
  String get finalCurrentDate {
    _$finalCurrentDateAtom.reportRead();
    return super.finalCurrentDate;
  }

  @override
  set finalCurrentDate(String value) {
    _$finalCurrentDateAtom.reportWrite(value, super.finalCurrentDate, () {
      super.finalCurrentDate = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_PaymentSummeryViewModel.selected', context: context);

  @override
  DriverTransactionPaymentSummeryType get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(DriverTransactionPaymentSummeryType value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$datelistItemAsyncAction =
      AsyncAction('_PaymentSummeryViewModel.datelistItem', context: context);

  @override
  Future datelistItem() {
    return _$datelistItemAsyncAction.run(() => super.datelistItem());
  }

  late final _$_PaymentSummeryViewModelActionController =
      ActionController(name: '_PaymentSummeryViewModel', context: context);

  @override
  dynamic currentDate() {
    final _$actionInfo = _$_PaymentSummeryViewModelActionController.startAction(
        name: '_PaymentSummeryViewModel.currentDate');
    try {
      return super.currentDate();
    } finally {
      _$_PaymentSummeryViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? selected) {
    final _$actionInfo = _$_PaymentSummeryViewModelActionController.startAction(
        name: '_PaymentSummeryViewModel.onSelectDate');
    try {
      return super.onSelectDate(selected);
    } finally {
      _$_PaymentSummeryViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPaymentmetodChanged(DriverTransactionPaymentSummeryType? type) {
    final _$actionInfo = _$_PaymentSummeryViewModelActionController.startAction(
        name: '_PaymentSummeryViewModel.onPaymentmetodChanged');
    try {
      return super.onPaymentmetodChanged(type);
    } finally {
      _$_PaymentSummeryViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rechargeHistory: ${rechargeHistory},
data: ${data},
isLoading: ${isLoading},
Rmessage: ${Rmessage},
datesSelectedListLoader: ${datesSelectedListLoader},
finalCurrentDate: ${finalCurrentDate},
selected: ${selected}
    ''';
  }
}
