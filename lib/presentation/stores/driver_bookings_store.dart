import 'dart:async';
import 'dart:math';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/customer_details.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';
import 'package:jadu_ride_driver/core/repository/driver_bookings_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:mobx/mobx.dart';

part 'driver_bookings_store.g.dart';

class DriverBookingStore = _DriverBookingsStore with _$DriverBookingStore;

abstract class _DriverBookingsStore with Store {
  final _repository = dependency<DriverBookingsRepository>();

  @observable
  ObservableSet<Marker> customers = ObservableSet.of({});

  @observable
  CustomerDetails? details;

  @observable
  String pickUpLocation = "";

  @observable
  String estimatedKm = "";

  @observable
  String eta = "";

  final googleMap = const Key("GOOGLE_MAP");
  late final GoogleMapController? _controller;

  StreamSubscription<DriverBookingDetails>? _streamDisposer;

  @observable
  String vehicleType = "";

  @observable
  int passTimer = 0;

  onMapCreate(GoogleMapController controller, BuildContext context) async {
    //_onBooking(controller, context);
  }

  disposers() {
    _streamDisposer?.cancel();
    _controller?.dispose();
  }

  @action
  _onBooking(GoogleMapController controller, BuildContext context) {
    customers.clear();
    _streamDisposer = _repository.booking().stream.listen((data) async {
      var bookingDetails = data;
      var bitMap = await MarkerIcon.svgAsset(
          assetName: ImageAssets.customerMarker, context: context, size: 48);
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
          LatLng(bookingDetails.lat, bookingDetails.lng), 20));
    });
  }
}
