// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_trip_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PayTripStore on IPayTripStore, Store {
  late final _$totalRideFareResponseAtom =
      Atom(name: 'IPayTripStore.totalRideFareResponse', context: context);

  @override
  TotalRideFareResponse? get totalRideFareResponse {
    _$totalRideFareResponseAtom.reportRead();
    return super.totalRideFareResponse;
  }

  @override
  set totalRideFareResponse(TotalRideFareResponse? value) {
    _$totalRideFareResponseAtom.reportWrite(value, super.totalRideFareResponse,
        () {
      super.totalRideFareResponse = value;
    });
  }

  late final _$IPayTripStoreActionController =
      ActionController(name: 'IPayTripStore', context: context);

  @override
  dynamic initiateRideFare(TotalRideFareResponse response) {
    final _$actionInfo = _$IPayTripStoreActionController.startAction(
        name: 'IPayTripStore.initiateRideFare');
    try {
      return super.initiateRideFare(response);
    } finally {
      _$IPayTripStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic amountCollected() {
    final _$actionInfo = _$IPayTripStoreActionController.startAction(
        name: 'IPayTripStore.amountCollected');
    try {
      return super.amountCollected();
    } finally {
      _$IPayTripStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalRideFareResponse: ${totalRideFareResponse}
    ''';
  }
}
