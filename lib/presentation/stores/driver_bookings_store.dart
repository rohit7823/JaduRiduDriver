import 'dart:async';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/booking_status.dart';
import 'package:jadu_ride_driver/core/domain/customer_details.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';
import 'package:jadu_ride_driver/core/domain/ride_initiate_data.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/driver_bookings_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/utills/socket_io.dart';
import 'package:mobx/mobx.dart';

import '../../core/domain/booking_accepted.dart';
import 'package:rxdart/subjects.dart';

part 'driver_bookings_store.g.dart';

class DriverBookingStore = _DriverBookingsStore with _$DriverBookingStore;

abstract class _DriverBookingsStore with Store {
  final _repository = dependency<DriverBookingsRepository>();
  final _prefs = dependency<Storage>();

  @observable
  RideInitiateData? onRideData;

  @observable
  ObservableSet<Marker> customers = ObservableSet.of({});

  @observable
  CustomerDetails? details;

  @observable
  String pickUpLocation = "";

  @observable
  String alreadyBookedMsg = "";

  @observable
  String estimatedKm = "";

  @observable
  String eta = "";

  final googleMap = const Key("GOOGLE_MAP");
  late final GoogleMapController? _controller;

  StreamSubscription<DriverBookingDetails>? _streamDisposer;
  StreamSubscription<Object>? _bookingDisposer;

  @observable
  String vehicleType = "";

  String currentBookingId = "";

  @observable
  int passTimer = 0;

  DriverBookingDetails? newBooking;

  _DriverBookingsStore() {}

  onMapCreate(GoogleMapController controller, BuildContext context) async {
    _onBooking(controller, context);
    if (newBooking != null) {
      controller.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(newBooking!.lat, newBooking!.lng), 20));
    }
  }

  disposers() {
    _streamDisposer?.cancel();
    _bookingDisposer?.cancel();
    _controller?.dispose();
  }

  @action
  _onBooking(GoogleMapController controller, BuildContext context) {
    _streamDisposer = _repository.booking().stream.listen((data) async {
      customers.clear();
      newBooking = data;
      var bookingDetails = data;
      var bitMap = await MarkerIcon.svgAsset(
          assetName: ImageAssets.customerMarker, context: context, size: 48);
      currentBookingId = bookingDetails.bookId;
      var customer = Marker(
        markerId: MarkerId(bookingDetails.bookId),
        position: LatLng(bookingDetails.lat, bookingDetails.lng),
        icon: bitMap,
        draggable: false,
        consumeTapEvents: false,
      );
      details = bookingDetails.customerDetails;
      vehicleType = bookingDetails.vehicleType;
      passTimer = bookingDetails.passTimer;
      pickUpLocation = bookingDetails.pickUpLocation;
      estimatedKm = bookingDetails.estimateDistance;
      eta = bookingDetails.eta;
      customers.add(customer);
      controller.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(newBooking!.lat, newBooking!.lng), 20));
    });
  }

  onBookingPass(BookingStatus status) {
    customers.clear();
    newBooking = null;
    _repository.bookingStatus(status.key, currentBookingId, _prefs.userId());
  }

  onBookingAccept(BookingStatus status) {
    customers.clear();
    newBooking = null;
    _repository.bookingStatus(status.key, currentBookingId, _prefs.userId());
  }

  @action
  afterBookingAcceptedListen() {
    _bookingDisposer =
        _repository.onBookingAccepted().stream.listen((response) {
      if (response is BookingAccepted &&
          response.status == BookingStatus.passBooking.key) {
        onBookingPass(BookingStatus.passBooking);
        alreadyBookedMsg = response.msg;
      } else if (response is RideInitiateData) {
        debugPrint("data initialized $response");
        onRideData = response;
      }
    });
  }
}
