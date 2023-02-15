import 'dart:async';
import 'dart:developer';

import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/booking_status.dart';
import 'package:jadu_ride_driver/core/common/socket_events.dart';
import 'package:jadu_ride_driver/core/domain/customer_details.dart';
import 'package:jadu_ride_driver/core/domain/driver_booking_details.dart';
import 'package:jadu_ride_driver/core/domain/ride_initiate_data.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/driver_bookings_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/directions.dart';
import 'package:jadu_ride_driver/utills/distinct_data.dart';
import 'package:jadu_ride_driver/utills/environment.dart';
import 'package:jadu_ride_driver/utills/socket_io.dart';
import 'package:mobx/mobx.dart';

import '../../core/domain/booking_accepted.dart';

part 'driver_bookings_store.g.dart';

class DriverBookingStore = _DriverBookingsStore with _$DriverBookingStore;

abstract class _DriverBookingsStore with Store {
  final _repository = dependency<DriverBookingsRepository>();
  final _prefs = dependency<Storage>();
  final _env = dependency<Environment>();
  @observable
  RideInitiateData? onRideData;

  @observable
  ObservableSet<Marker> customers = ObservableSet.of({});

  @observable
  CustomerDetails? details;

  @observable
  String pickUpLocation = "";

  @observable
  String dropLocation = "";

  @observable
  String fare = "";

  @observable
  String alreadyBookedMsg = "";

  @observable
  String estimatedKm = "";

  @observable
  String eta = "";

  final googleMap = const Key("GOOGLE_MAP");
  final GoogleMapController? _controller = null;

  StreamSubscription<DriverBookingDetails>? _streamDisposer;
  StreamSubscription<Object>? _bookingDisposer;

  @observable
  String vehicleType = "";

  String currentBookingId = "";

  LatLng? _currentLocation;

  @observable
  int passTimer = 0;

  DriverBookingDetails? newBooking;

  @observable
  String? bookingAlertSoundUrl;

  onMapCreate(GoogleMapController controller, BuildContext context) async {
    _onBooking(controller, context);
    if (newBooking != null) {
      controller.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(newBooking!.lat, newBooking!.lng), 20));
    }
  }

  instantiateCurrentLocation(LatLng location) {
    _currentLocation = location;
  }

  disposers() {
    _streamDisposer?.cancel();
    _bookingDisposer?.cancel();
    _controller?.dispose();
  }

  _onBooking(GoogleMapController controller, BuildContext context) {
    _streamDisposer = _repository.booking().stream.listen((data) async {
      await initCurrentBooking(data, context);
      controller.animateCamera(CameraUpdate.newLatLngZoom(
          LatLng(newBooking!.lat, newBooking!.lng), 20));
    });
  }

  @action
  initCurrentBooking(DriverBookingDetails data, BuildContext context) async {
    customers.clear();
    newBooking = data;
    var bookingDetails = data;

    /*var bitMap = await MarkerIcon.svgAsset(
        assetName: ImageAssets.customerMarker, context: context, size: 48);*/

    currentBookingId = bookingDetails.bookId;
    fare = bookingDetails.fare ?? "";
    bookingAlertSoundUrl = bookingDetails.alertSoundUrl;
    var directionRes = await Directions(_env.googleApiKey)
        .origin(LatLng(bookingDetails.lat, bookingDetails.lng))
        .destination(LatLng(bookingDetails.destLat, bookingDetails.destLng))
        .request();

    if (directionRes != null) {
      pickUpLocation = directionRes.routes.first.legs.last.endAddress;
      dropLocation = directionRes.routes.last.legs.last.endAddress;
      estimatedKm = directionRes.routes.first.legs.last.distance.text;
      eta = directionRes.routes.first.legs.last.duration.text;
    } else {
      pickUpLocation = StringProvider.notAvailable;
    }

    var customer = Marker(
      markerId: MarkerId(bookingDetails.bookId),
      position: LatLng(bookingDetails.lat, bookingDetails.lng),
      icon: BitmapDescriptor.defaultMarker,
      draggable: false,
      consumeTapEvents: false,
    );
    details = bookingDetails.customerDetails;
    vehicleType = bookingDetails.vehicleType;
    passTimer = bookingDetails.passTimer;
    customers.add(customer);
  }

  onBookingPass(BookingStatus status) {
    customers.clear();
    newBooking = null;
    _repository.bookingStatus(status.key, currentBookingId, _prefs.userId());
  }

  onBookingAccept(BookingStatus status) {
    customers.clear();
    newBooking = null;
    log("bookingAccept ${status.key} $currentBookingId ${_prefs.userId()}");
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
        debugPrint(
            "data initialized ${response.serviceType} ${response.currentStage}");
        onRideData = response;
      }
    });
  }

  DistinctData<bool> distinctPaymentAcceptance = DistinctData();

  onPaymentAcceptance() {
    SocketIO.client.on(SocketEvents.paymentAcceptanceControl.value, (status) {
      debugPrint("paymentAcceptanceControl $status");
      distinctPaymentAcceptance.init(status, test: (cached, newly) => true);
    });
  }

  DistinctData<bool> distinctAfterPayment = DistinctData();

  afterPayment() {
    SocketIO.client.on(
        SocketEvents.afterPayment.value,
        (status) => distinctAfterPayment.init(status,
            test: (cached, newly) =>
                cached is bool && newly is bool && (!cached && newly)));
  }
}
