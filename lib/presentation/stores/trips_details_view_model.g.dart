// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TripsDetailsStore on _TripsViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_TripsViewModel.isLoading', context: context);

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

  late final _$selectedAtom =
      Atom(name: '_TripsViewModel.selected', context: context);

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

  late final _$datesSelectedListLoaderAtom =
      Atom(name: '_TripsViewModel.datesSelectedListLoader', context: context);

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
      Atom(name: '_TripsViewModel.finalCurrentDate', context: context);

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

  late final _$tripDetailsArrayListAtom =
      Atom(name: '_TripsViewModel.tripDetailsArrayList', context: context);

  @override
  List<TripsDetails> get tripDetailsArrayList {
    _$tripDetailsArrayListAtom.reportRead();
    return super.tripDetailsArrayList;
  }

  @override
  set tripDetailsArrayList(List<TripsDetails> value) {
    _$tripDetailsArrayListAtom.reportWrite(value, super.tripDetailsArrayList,
        () {
      super.tripDetailsArrayList = value;
    });
  }

  late final _$_initialDataAsyncAction =
      AsyncAction('_TripsViewModel._initialData', context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  late final _$_TripsViewModelActionController =
      ActionController(name: '_TripsViewModel', context: context);

  @override
  dynamic currentDate() {
    final _$actionInfo = _$_TripsViewModelActionController.startAction(
        name: '_TripsViewModel.currentDate');
    try {
      return super.currentDate();
    } finally {
      _$_TripsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? selected) {
    final _$actionInfo = _$_TripsViewModelActionController.startAction(
        name: '_TripsViewModel.onSelectDate');
    try {
      return super.onSelectDate(selected);
    } finally {
      _$_TripsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRadioSelected(DriverTransactionPaymentSummeryType? selectedValue) {
    final _$actionInfo = _$_TripsViewModelActionController.startAction(
        name: '_TripsViewModel.onRadioSelected');
    try {
      return super.onRadioSelected(selectedValue);
    } finally {
      _$_TripsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
selected: ${selected},
datesSelectedListLoader: ${datesSelectedListLoader},
finalCurrentDate: ${finalCurrentDate},
tripDetailsArrayList: ${tripDetailsArrayList}
    ''';
  }
}
