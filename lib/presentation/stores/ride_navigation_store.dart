import 'dart:async';

import 'package:floating/floating.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/common/ride_stages.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/cilent_waiting_response.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/core/domain/ride_navigation_data.dart';
import 'package:jadu_ride_driver/core/repository/ride_navigation_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/google_map_direction_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/message_informer.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/utills/directions.dart' as google;
import 'package:jadu_ride_driver/utills/extensions.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/screen.dart';
import '../../helpers_impls/app_location_service.dart';
import '../../utills/environment.dart';
import '../ui/image_assets.dart';

part 'ride_navigation_store.g.dart';

class RideNavStore = _RideNavigationStore with _$RideNavStore;

abstract class _RideNavigationStore extends AppNavigator with Store {
  final _repository = dependency<RideNavigationRepository>();
  final env = dependency<Environment>();
  final AppLocationService _locationService = AppLocationService();
  late final google.Directions directions;
  List<StreamSubscription<dynamic>?> _disposers = [];
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

  late final BitmapDescriptor _personBitMap;
  late final BitmapDescriptor _carBitMap;

  _RideNavigationStore(this.rideNavigationData) {
    _createBitMaps();
    directions = google.Directions(env.googleApiKey);
    _directionImpl = GoogleMapDirectionImpl(env.googleApiKey);
    onCancelRide();
  }

  dispose() {
    for (var element in _disposers) {
      element?.cancel();
    }
    _controller?.dispose();
  }

  _createBitMaps() async {
    _personBitMap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), ImageAssets.customerMarkerPng);
    _carBitMap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      ImageAssets.car_icon,
    );
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
        icon: _personBitMap,
      )
    };
  }

  @action
  initiateTimerDuration(int min, int seconds) {
    timerDuration = Duration(minutes: min, seconds: seconds);
  }

  bool _isSendLiveLocation = true;

  stropLocationSender() {
    _isSendLiveLocation = false;
  }

  @action
  _updateCurrentLocation(LatLong target) async {
    while (_isSendLiveLocation) {
      await Future.delayed(const Duration(seconds: 5));
      debugPrint("liveLocation from Store");
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
            icon: _carBitMap,
          ),
          Marker(
            markerId: MarkerId(target.hashCode.toString()),
            position: LatLng(target.lat, target.lng),
            icon: _personBitMap,
          )
        };
      } else {
        break;
      }
    }
  }

  onNavigate() async {
    await pipMode.enable(const Rational(1, 1));
    var isSuccessful = await _directionImpl.openDirectionView(
        rideNavigationData.data.pickUpLocation.lat,
        rideNavigationData.data.pickUpLocation.lng);

    if (!isSuccessful) {
      messageInformer.informUi("Unable to open map direction, Try again.");
    } else {}
  }

  onCancelRide() {
    _disposers.add(_repository.onCancelRide().stream.listen((res) {
      if (res.isCanceled) {
        messageInformer.informUi(res.msg);
        stropLocationSender();
        onChange(ScreenWithExtras(screen: Screen.dashBoard));
      }
    }));
  }

  @action
  onClientLocated() {
    _disposers.add(_repository.clientLocated().stream.listen((response) async {
      if (response is ClientWaitingResponse) {
        currentRideStage = response.rideStage.toRideStage();
        initiateTimerDuration(
            response.clientTimer.min, response.clientTimer.second);
      }
    }));
  }

  onArrivedTimeOut() {
    debugPrint("timeOut");
    initiateTimerDuration(5, 30);
  }

  openNavigation() {}

  onPipEnter() {}

  onPipExit() {}

  @observable
  bool tripStartLoader = false;

  @action
  onStartTrip() async {
    onChange(ScreenWithExtras(
        screen: Screen.verifyTripOtp,
        argument: RideIds(
            rideId: rideNavigationData.tripId,
            driverId: rideNavigationData.driverId,
            customerName: customer)));
  }

  @action
  verifyOtp() async {
    tripStartLoader = false;
    await Future.delayed(const Duration(seconds: 1));
    tripStartLoader = true;
  }
}
