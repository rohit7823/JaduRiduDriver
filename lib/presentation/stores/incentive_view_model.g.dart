// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incentive_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$IncentivesStore on _IncentivesViewModel, Store {
  late final _$incentiveListAtom =
      Atom(name: '_IncentivesViewModel.incentiveList', context: context);

  @override
  List<Incentive> get incentiveList {
    _$incentiveListAtom.reportRead();
    return super.incentiveList;
  }

  @override
  set incentiveList(List<Incentive> value) {
    _$incentiveListAtom.reportWrite(value, super.incentiveList, () {
      super.incentiveList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_IncentivesViewModel.isLoading', context: context);

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

  late final _$listItemAsyncAction =
      AsyncAction('_IncentivesViewModel.listItem', context: context);

  @override
  Future listItem() {
    return _$listItemAsyncAction.run(() => super.listItem());
  }

  @override
  String toString() {
    return '''
incentiveList: ${incentiveList},
isLoading: ${isLoading}
    ''';
  }
}
