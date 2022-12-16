// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_place_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmergencyPlaceStore on _IEmergencyPlaceStore, Store {
  late final _$destinationAtom =
      Atom(name: '_IEmergencyPlaceStore.destination', context: context);

  @override
  EmergencyPlace? get destination {
    _$destinationAtom.reportRead();
    return super.destination;
  }

  @override
  set destination(EmergencyPlace? value) {
    _$destinationAtom.reportWrite(value, super.destination, () {
      super.destination = value;
    });
  }

  late final _$originAtom =
      Atom(name: '_IEmergencyPlaceStore.origin', context: context);

  @override
  Object? get origin {
    _$originAtom.reportRead();
    return super.origin;
  }

  @override
  set origin(Object? value) {
    _$originAtom.reportWrite(value, super.origin, () {
      super.origin = value;
    });
  }

  late final _$scrollToIdxAtom =
      Atom(name: '_IEmergencyPlaceStore.scrollToIdx', context: context);

  @override
  int? get scrollToIdx {
    _$scrollToIdxAtom.reportRead();
    return super.scrollToIdx;
  }

  @override
  set scrollToIdx(int? value) {
    _$scrollToIdxAtom.reportWrite(value, super.scrollToIdx, () {
      super.scrollToIdx = value;
    });
  }

  late final _$_IEmergencyPlaceStoreActionController =
      ActionController(name: '_IEmergencyPlaceStore', context: context);

  @override
  dynamic onSelectEnding(EmergencyPlace? emergencyPlace) {
    final _$actionInfo = _$_IEmergencyPlaceStoreActionController.startAction(
        name: '_IEmergencyPlaceStore.onSelectEnding');
    try {
      return super.onSelectEnding(emergencyPlace);
    } finally {
      _$_IEmergencyPlaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectStarting(Object starting) {
    final _$actionInfo = _$_IEmergencyPlaceStoreActionController.startAction(
        name: '_IEmergencyPlaceStore.onSelectStarting');
    try {
      return super.onSelectStarting(starting);
    } finally {
      _$_IEmergencyPlaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onTapPlace(EmergencyPlace place) {
    final _$actionInfo = _$_IEmergencyPlaceStoreActionController.startAction(
        name: '_IEmergencyPlaceStore.onTapPlace');
    try {
      return super.onTapPlace(place);
    } finally {
      _$_IEmergencyPlaceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
destination: ${destination},
origin: ${origin},
scrollToIdx: ${scrollToIdx}
    ''';
  }
}
