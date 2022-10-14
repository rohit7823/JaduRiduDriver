import 'dart:async';

import 'package:floating/floating.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/common/ride_stages.dart';
import 'package:jadu_ride_driver/core/domain/ride_id.dart';
import 'package:jadu_ride_driver/core/repository/ride_navigation_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/google_map_direction_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/message_informer.dart';
import 'package:jadu_ride_driver/utills/app_pip_service.dart';
import 'package:jadu_ride_driver/utills/directions.dart' as google;
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../../helpers_impls/app_location_service.dart';
import '../../utills/environment.dart';

part 'ride_navigation_store.g.dart';

class RideNavStore = _RideNavigationStore with _$RideNavStore;

abstract class _RideNavigationStore with Store {
  final _repository = dependency<RideNavigationRepository>();
  final env = dependency<Environment>();
  final AppLocationService _locationService = AppLocationService();
  late final google.Directions directions;
  StreamSubscription<Object>? _streamDisposer;
  late final GoogleMapDirectionImpl _directionImpl;
  final messageInformer = MessageInformer();
  final pipMode = Floating();
  RideNavigationData rideNavigationData;

  //late Position currentPos;

  /*@observable
  LatLng currentLocation = const LatLng(22.832132, 33.783123);*/

  @observable
  Set<Marker> points = {};

  @observable
  Set<Polyline> lines = {};

  @observable
  Duration timerDuration = Duration.zero;

  @observable
  String customer = "";

  @observable
  RideStages currentRideStage = RideStages.none;

  @observable
  String currentServiceIconPath = "";

  GoogleMapController? _controller;

  @observable
  google.Route? pickUpRoute;

  _RideNavigationStore(this.rideNavigationData) {
    directions = google.Directions(env.googleApiKey);
    _directionImpl = GoogleMapDirectionImpl(env.googleApiKey);
  }

  dispose() {
    _streamDisposer?.cancel();
    _controller?.dispose();
  }

  /*@action
  _accessCurrentLocation() async {
    currentPos = await _locationService.getCurrentLocation();
    currentLocation = LatLng(currentPos.latitude, currentPos.longitude);
  }*/

  onMapCreated(GoogleMapController mapController) {
    _controller = mapController;
    _placeCoordinates(rideNavigationData.data.pickUpLocation);
    debugPrint("timer ${rideNavigationData.data.timer}");
    initiateTimerDuration(rideNavigationData.data.timer);
    customer = rideNavigationData.data.customerName;
    currentRideStage = rideNavigationData.data.currentStage.toRideStage();
    currentServiceIconPath =
        rideNavigationData.data.serviceType.toServiceIconPath();
    _updateCurrentLocation(rideNavigationData.data.pickUpLocation);
  }

  /*_onRide() {
    _streamDisposer = _repository.ride(rideNavigationData).stream.listen((data) {
      if (data is RideInitiateData) {
        debugPrint("rideInitiate $data");
        rideInitializationData = data;
      }
    });
  }*/

  @action
  _placeCoordinates(LatLong pickUpLocation) async {
    var locations = await directions.process([
      rideNavigationData.currentLocation,
      LatLng(pickUpLocation.lat, pickUpLocation.lng)
    ]);

    if (locations != null) {
      pickUpRoute = locations.routes.last;

      lines = {
        Polyline(
            width: 6,
            endCap: Cap.roundCap,
            startCap: Cap.roundCap,
            jointType: JointType.round,
            polylineId: PolylineId(pickUpLocation.hashCode.toString()),
            points: locations.polylineDecoded!)
      };
    }

    points = {
      Marker(
        markerId: MarkerId(pickUpLocation.hashCode.toString()),
        position: LatLng(pickUpLocation.lat, pickUpLocation.lng),
        icon: BitmapDescriptor.defaultMarker,
      )
    };
  }

  @action
  initiateTimerDuration(int timer) {
    timerDuration = Duration(seconds: timer);
  }

  @action
  _updateCurrentLocation(LatLong target) async {
    while (true) {
      //await Future.delayed(const Duration(milliseconds: 100));
      var position = await _locationService.getCurrentLocation();
      var cl = LatLng(position.latitude, position.longitude);
      if (cl.latitude != target.lat && cl.longitude != target.lng) {
        _repository.updateCurrentLocation(
            LatLong(lat: cl.latitude, lng: cl.longitude),
            rideNavigationData.customerId,
            rideNavigationData.driverId);
        points = {
          Marker(
            markerId: MarkerId(cl.hashCode.toString()),
            position: LatLng(cl.latitude, cl.longitude),
            icon: BitmapDescriptor.defaultMarker,
          ),
          Marker(
            markerId: MarkerId(target.hashCode.toString()),
            position: LatLng(target.lat, target.lng),
            icon: BitmapDescriptor.defaultMarker,
          )
        };
      } else {
        break;
      }
    }
  }

  onNavigate() async {
    await pipMode.enable(const Rational.square());
    var isSuccessful = await _directionImpl.openDirectionView(
        rideNavigationData.data.pickUpLocation.lat,
        rideNavigationData.data.pickUpLocation.lng);

    if (!isSuccessful) {
      messageInformer.informUi("Unable to open map direction, Try again.");
    } else {}
  }

  onClientLocated() {}

  onArrivedTimeOut() {}

  openNavigation() {}

  onPipEnter() {}

  onPipExit() {}
}
