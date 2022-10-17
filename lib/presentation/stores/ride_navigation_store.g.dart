// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ride_navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RideNavStore on _RideNavigationStore, Store {
  late final _$pointsAtom =
      Atom(name: '_RideNavigationStore.points', context: context);

  @override
  Set<Marker> get points {
    _$pointsAtom.reportRead();
    return super.points;
  }

  @override
  set points(Set<Marker> value) {
    _$pointsAtom.reportWrite(value, super.points, () {
      super.points = value;
    });
  }

  late final _$linesAtom =
      Atom(name: '_RideNavigationStore.lines', context: context);

  @override
  Set<Polyline> get lines {
    _$linesAtom.reportRead();
    return super.lines;
  }

  @override
  set lines(Set<Polyline> value) {
    _$linesAtom.reportWrite(value, super.lines, () {
      super.lines = value;
    });
  }

  late final _$timerDurationAtom =
      Atom(name: '_RideNavigationStore.timerDuration', context: context);

  @override
  Duration get timerDuration {
    _$timerDurationAtom.reportRead();
    return super.timerDuration;
  }

  @override
  set timerDuration(Duration value) {
    _$timerDurationAtom.reportWrite(value, super.timerDuration, () {
      super.timerDuration = value;
    });
  }

  late final _$customerAtom =
      Atom(name: '_RideNavigationStore.customer', context: context);

  @override
  String get customer {
    _$customerAtom.reportRead();
    return super.customer;
  }

  @override
  set customer(String value) {
    _$customerAtom.reportWrite(value, super.customer, () {
      super.customer = value;
    });
  }

  late final _$currentRideStageAtom =
      Atom(name: '_RideNavigationStore.currentRideStage', context: context);

  @override
  RideStages get currentRideStage {
    _$currentRideStageAtom.reportRead();
    return super.currentRideStage;
  }

  @override
  set currentRideStage(RideStages value) {
    _$currentRideStageAtom.reportWrite(value, super.currentRideStage, () {
      super.currentRideStage = value;
    });
  }

  late final _$currentServiceIconPathAtom = Atom(
      name: '_RideNavigationStore.currentServiceIconPath', context: context);

  @override
  String get currentServiceIconPath {
    _$currentServiceIconPathAtom.reportRead();
    return super.currentServiceIconPath;
  }

  @override
  set currentServiceIconPath(String value) {
    _$currentServiceIconPathAtom
        .reportWrite(value, super.currentServiceIconPath, () {
      super.currentServiceIconPath = value;
    });
  }

  late final _$pickUpRouteAtom =
      Atom(name: '_RideNavigationStore.pickUpRoute', context: context);

  @override
  google.Route? get pickUpRoute {
    _$pickUpRouteAtom.reportRead();
    return super.pickUpRoute;
  }

  @override
  set pickUpRoute(google.Route? value) {
    _$pickUpRouteAtom.reportWrite(value, super.pickUpRoute, () {
      super.pickUpRoute = value;
    });
  }

  late final _$tripStartLoaderAtom =
      Atom(name: '_RideNavigationStore.tripStartLoader', context: context);

  @override
  bool get tripStartLoader {
    _$tripStartLoaderAtom.reportRead();
    return super.tripStartLoader;
  }

  @override
  set tripStartLoader(bool value) {
    _$tripStartLoaderAtom.reportWrite(value, super.tripStartLoader, () {
      super.tripStartLoader = value;
    });
  }

  late final _$_placeCoordinatesAsyncAction =
      AsyncAction('_RideNavigationStore._placeCoordinates', context: context);

  @override
  Future _placeCoordinates(LatLong pickUpLocation) {
    return _$_placeCoordinatesAsyncAction
        .run(() => super._placeCoordinates(pickUpLocation));
  }

  late final _$_updateCurrentLocationAsyncAction = AsyncAction(
      '_RideNavigationStore._updateCurrentLocation',
      context: context);

  @override
  Future _updateCurrentLocation(LatLong target) {
    return _$_updateCurrentLocationAsyncAction
        .run(() => super._updateCurrentLocation(target));
  }

  late final _$onStartTripAsyncAction =
      AsyncAction('_RideNavigationStore.onStartTrip', context: context);

  @override
  Future onStartTrip() {
    return _$onStartTripAsyncAction.run(() => super.onStartTrip());
  }

  late final _$verifyOtpAsyncAction =
      AsyncAction('_RideNavigationStore.verifyOtp', context: context);

  @override
  Future verifyOtp() {
    return _$verifyOtpAsyncAction.run(() => super.verifyOtp());
  }

  late final _$_RideNavigationStoreActionController =
      ActionController(name: '_RideNavigationStore', context: context);

  @override
  dynamic initiateTimerDuration(int min, int seconds) {
    final _$actionInfo = _$_RideNavigationStoreActionController.startAction(
        name: '_RideNavigationStore.initiateTimerDuration');
    try {
      return super.initiateTimerDuration(min, seconds);
    } finally {
      _$_RideNavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onClientLocated() {
    final _$actionInfo = _$_RideNavigationStoreActionController.startAction(
        name: '_RideNavigationStore.onClientLocated');
    try {
      return super.onClientLocated();
    } finally {
      _$_RideNavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
points: ${points},
lines: ${lines},
timerDuration: ${timerDuration},
customer: ${customer},
currentRideStage: ${currentRideStage},
currentServiceIconPath: ${currentServiceIconPath},
pickUpRoute: ${pickUpRoute},
tripStartLoader: ${tripStartLoader}
    ''';
  }
}
