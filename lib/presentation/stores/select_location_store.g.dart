// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_location_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectLocationStore on _ISelectLocationStore, Store {
  late final _$loaderAtom =
      Atom(name: '_ISelectLocationStore.loader', context: context);

  @override
  bool get loader {
    _$loaderAtom.reportRead();
    return super.loader;
  }

  @override
  set loader(bool value) {
    _$loaderAtom.reportWrite(value, super.loader, () {
      super.loader = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_ISelectLocationStore.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$noDataNotifyAtom =
      Atom(name: '_ISelectLocationStore.noDataNotify', context: context);

  @override
  String? get noDataNotify {
    _$noDataNotifyAtom.reportRead();
    return super.noDataNotify;
  }

  @override
  set noDataNotify(String? value) {
    _$noDataNotifyAtom.reportWrite(value, super.noDataNotify, () {
      super.noDataNotify = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_ISelectLocationStore.selected', context: context);

  @override
  AutocompletePrediction? get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(AutocompletePrediction? value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$predictionsAtom =
      Atom(name: '_ISelectLocationStore.predictions', context: context);

  @override
  ObservableList<AutocompletePrediction> get predictions {
    _$predictionsAtom.reportRead();
    return super.predictions;
  }

  @override
  set predictions(ObservableList<AutocompletePrediction> value) {
    _$predictionsAtom.reportWrite(value, super.predictions, () {
      super.predictions = value;
    });
  }

  late final _$onSearchQueryAsyncAction =
      AsyncAction('_ISelectLocationStore.onSearchQuery', context: context);

  @override
  Future onSearchQuery(String query) {
    return _$onSearchQueryAsyncAction.run(() => super.onSearchQuery(query));
  }

  late final _$onDoneAsyncAction =
      AsyncAction('_ISelectLocationStore.onDone', context: context);

  @override
  Future onDone(AutocompletePrediction prediction) {
    return _$onDoneAsyncAction.run(() => super.onDone(prediction));
  }

  late final _$_ISelectLocationStoreActionController =
      ActionController(name: '_ISelectLocationStore', context: context);

  @override
  dynamic onSelectPrediction(AutocompletePrediction prediction) {
    final _$actionInfo = _$_ISelectLocationStoreActionController.startAction(
        name: '_ISelectLocationStore.onSelectPrediction');
    try {
      return super.onSelectPrediction(prediction);
    } finally {
      _$_ISelectLocationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loader: ${loader},
searchQuery: ${searchQuery},
noDataNotify: ${noDataNotify},
selected: ${selected},
predictions: ${predictions}
    ''';
  }
}
