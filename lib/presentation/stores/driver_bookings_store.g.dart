// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_bookings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DriverBookingStore on _DriverBookingsStore, Store {
  late final _$onRideDataAtom =
      Atom(name: '_DriverBookingsStore.onRideData', context: context);

  @override
  RideInitiateData? get onRideData {
    _$onRideDataAtom.reportRead();
    return super.onRideData;
  }

  @override
  set onRideData(RideInitiateData? value) {
    _$onRideDataAtom.reportWrite(value, super.onRideData, () {
      super.onRideData = value;
    });
  }

  late final _$customersAtom =
      Atom(name: '_DriverBookingsStore.customers', context: context);

  @override
  ObservableSet<Marker> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableSet<Marker> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  late final _$detailsAtom =
      Atom(name: '_DriverBookingsStore.details', context: context);

  @override
  CustomerDetails? get details {
    _$detailsAtom.reportRead();
    return super.details;
  }

  @override
  set details(CustomerDetails? value) {
    _$detailsAtom.reportWrite(value, super.details, () {
      super.details = value;
    });
  }

  late final _$pickUpLocationAtom =
      Atom(name: '_DriverBookingsStore.pickUpLocation', context: context);

  @override
  String get pickUpLocation {
    _$pickUpLocationAtom.reportRead();
    return super.pickUpLocation;
  }

  @override
  set pickUpLocation(String value) {
    _$pickUpLocationAtom.reportWrite(value, super.pickUpLocation, () {
      super.pickUpLocation = value;
    });
  }

  late final _$dropLocationAtom =
      Atom(name: '_DriverBookingsStore.dropLocation', context: context);

  @override
  String get dropLocation {
    _$dropLocationAtom.reportRead();
    return super.dropLocation;
  }

  @override
  set dropLocation(String value) {
    _$dropLocationAtom.reportWrite(value, super.dropLocation, () {
      super.dropLocation = value;
    });
  }

  late final _$fareAtom =
      Atom(name: '_DriverBookingsStore.fare', context: context);

  @override
  String get fare {
    _$fareAtom.reportRead();
    return super.fare;
  }

  @override
  set fare(String value) {
    _$fareAtom.reportWrite(value, super.fare, () {
      super.fare = value;
    });
  }

  late final _$alreadyBookedMsgAtom =
      Atom(name: '_DriverBookingsStore.alreadyBookedMsg', context: context);

  @override
  String get alreadyBookedMsg {
    _$alreadyBookedMsgAtom.reportRead();
    return super.alreadyBookedMsg;
  }

  @override
  set alreadyBookedMsg(String value) {
    _$alreadyBookedMsgAtom.reportWrite(value, super.alreadyBookedMsg, () {
      super.alreadyBookedMsg = value;
    });
  }

  late final _$estimatedKmAtom =
      Atom(name: '_DriverBookingsStore.estimatedKm', context: context);

  @override
  String get estimatedKm {
    _$estimatedKmAtom.reportRead();
    return super.estimatedKm;
  }

  @override
  set estimatedKm(String value) {
    _$estimatedKmAtom.reportWrite(value, super.estimatedKm, () {
      super.estimatedKm = value;
    });
  }

  late final _$etaAtom =
      Atom(name: '_DriverBookingsStore.eta', context: context);

  @override
  String get eta {
    _$etaAtom.reportRead();
    return super.eta;
  }

  @override
  set eta(String value) {
    _$etaAtom.reportWrite(value, super.eta, () {
      super.eta = value;
    });
  }

  late final _$vehicleTypeAtom =
      Atom(name: '_DriverBookingsStore.vehicleType', context: context);

  @override
  String get vehicleType {
    _$vehicleTypeAtom.reportRead();
    return super.vehicleType;
  }

  @override
  set vehicleType(String value) {
    _$vehicleTypeAtom.reportWrite(value, super.vehicleType, () {
      super.vehicleType = value;
    });
  }

  late final _$passTimerAtom =
      Atom(name: '_DriverBookingsStore.passTimer', context: context);

  @override
  int get passTimer {
    _$passTimerAtom.reportRead();
    return super.passTimer;
  }

  @override
  set passTimer(int value) {
    _$passTimerAtom.reportWrite(value, super.passTimer, () {
      super.passTimer = value;
    });
  }

  late final _$bookingAlertSoundUrlAtom =
      Atom(name: '_DriverBookingsStore.bookingAlertSoundUrl', context: context);

  @override
  String? get bookingAlertSoundUrl {
    _$bookingAlertSoundUrlAtom.reportRead();
    return super.bookingAlertSoundUrl;
  }

  @override
  set bookingAlertSoundUrl(String? value) {
    _$bookingAlertSoundUrlAtom.reportWrite(value, super.bookingAlertSoundUrl,
        () {
      super.bookingAlertSoundUrl = value;
    });
  }

  late final _$initCurrentBookingAsyncAction =
      AsyncAction('_DriverBookingsStore.initCurrentBooking', context: context);

  @override
  Future initCurrentBooking(DriverBookingDetails data, BuildContext context) {
    return _$initCurrentBookingAsyncAction
        .run(() => super.initCurrentBooking(data, context));
  }

  late final _$_DriverBookingsStoreActionController =
      ActionController(name: '_DriverBookingsStore', context: context);

  @override
  dynamic afterBookingAcceptedListen() {
    final _$actionInfo = _$_DriverBookingsStoreActionController.startAction(
        name: '_DriverBookingsStore.afterBookingAcceptedListen');
    try {
      return super.afterBookingAcceptedListen();
    } finally {
      _$_DriverBookingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
onRideData: ${onRideData},
customers: ${customers},
details: ${details},
pickUpLocation: ${pickUpLocation},
dropLocation: ${dropLocation},
fare: ${fare},
alreadyBookedMsg: ${alreadyBookedMsg},
estimatedKm: ${estimatedKm},
eta: ${eta},
vehicleType: ${vehicleType},
passTimer: ${passTimer},
bookingAlertSoundUrl: ${bookingAlertSoundUrl}
    ''';
  }
}
