// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_balance_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentBalanceStore on _CurrentBalanceViewModel, Store {
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

  late final _$selectedDatesAtom =
      Atom(name: '_CurrentBalanceViewModel.selectedDates', context: context);

  @override
  Package? get selectedDates {
    _$selectedDatesAtom.reportRead();
    return super.selectedDates;
  }

  @override
  set selectedDates(Package? value) {
    _$selectedDatesAtom.reportWrite(value, super.selectedDates, () {
      super.selectedDates = value;
    });
  }

  late final _$currentBalanceListAtom = Atom(
      name: '_CurrentBalanceViewModel.currentBalanceList', context: context);

  @override
  List<CurrentBalanceDates> get currentBalanceList {
    _$currentBalanceListAtom.reportRead();
    return super.currentBalanceList;
  }

  @override
  set currentBalanceList(List<CurrentBalanceDates> value) {
    _$currentBalanceListAtom.reportWrite(value, super.currentBalanceList, () {
      super.currentBalanceList = value;
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

  late final _$finalCurrentDateAtom =
      Atom(name: '_CurrentBalanceViewModel.finalCurrentDate', context: context);

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

  late final _$allDatelistItemAsyncAction =
      AsyncAction('_CurrentBalanceViewModel.allDatelistItem', context: context);

  @override
  Future allDatelistItem() {
    return _$allDatelistItemAsyncAction.run(() => super.allDatelistItem());
  }

  late final _$datelistItemAsyncAction =
      AsyncAction('_CurrentBalanceViewModel.datelistItem', context: context);

  @override
  Future datelistItem(String id) {
    return _$datelistItemAsyncAction.run(() => super.datelistItem(id));
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
  dynamic onState(Package? dates) {
    final _$actionInfo = _$_CurrentBalanceViewModelActionController.startAction(
        name: '_CurrentBalanceViewModel.onState');
    try {
      return super.onState(dates);
    } finally {
      _$_CurrentBalanceViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allDatesLists: ${allDatesLists},
selectedDates: ${selectedDates},
currentBalanceList: ${currentBalanceList},
isLoading: ${isLoading},
datesSelectedListLoader: ${datesSelectedListLoader},
finalCurrentDate: ${finalCurrentDate},
selected: ${selected}
    ''';
  }
}
