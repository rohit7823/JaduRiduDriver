import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/lat_long.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/overlay_permission_status.dart';
import 'package:jadu_ride_driver/core/common/ride_instruction.dart';
import 'package:jadu_ride_driver/core/common/ride_stages.dart';
import 'package:jadu_ride_driver/core/common/ride_stop.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/timestamp_with_direction.dart';
import 'package:jadu_ride_driver/core/domain/cilent_waiting_response.dart';
import 'package:jadu_ride_driver/core/domain/ride_ids.dart';
import 'package:jadu_ride_driver/core/domain/ride_location_response.dart';
import 'package:jadu_ride_driver/core/domain/ride_navigation_data.dart';
import 'package:jadu_ride_driver/core/repository/ride_navigation_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/google_map_direction_impl.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/service/ride_direction_foreground_service.dart';
import 'package:jadu_ride_driver/presentation/stores/message_informer.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
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
  final rideDirectionNavigationService = RideDirectionForegroundService();
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
  late final BitmapDescriptor _wayPointBitMap;
  late final BitmapDescriptor _destinationBitMap;

  @observable
  double sheetExtentFactor = 0;

  google.DirectionResponse? dropDirectionResponse;

  @observable
  bool endTripLoader = false;

  _RideNavigationStore(this.rideNavigationData) {
    directions = google.Directions(env.googleApiKey);
    rideDirectionNavigationService.init(
      channelID: StringProvider.jaduRideDirectionNavigationServiceID,
      channelName: StringProvider.jaduRideDirectionNavigationService,
    );
    _listenEvents();
    _createBitMaps();
    _directionImpl = GoogleMapDirectionImpl(env.googleApiKey);
    onCancelRide();
  }

  dispose() {
    for (var element in _disposers) {
      element?.cancel();
    }
    _controller?.dispose();
  }

  @action
  updateSheetExtentFactor(double extent) {
    sheetExtentFactor = (extent - 0.75) / 0.25;
  }

  _createBitMaps() async {
    _personBitMap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), ImageAssets.customerMarkerPng);
    _carBitMap = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      ImageAssets.car_icon,
    );
    _wayPointBitMap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), ImageAssets.wayPoint);
    _destinationBitMap = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), ImageAssets.destination);
  }

  /*@action
  _accessCurrentLocation() async {
    currentPos = await _locationService.getCurrentLocation();
    currentLocation = LatLng(currentPos.latitude, currentPos.longitude);
  }*/

  onMapCreated(GoogleMapController mapController) async {
    _controller = mapController;
    debugPrint("onMapCreate called");
    if (rideNavigationData.data.currentStage.toRideStage() ==
        RideStages.pickUp) {
      await _placeCoordinates(rideNavigationData.data.pickUpLocation);
    }
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

    debugPrint("directionResponse $locations");
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

  stopLocationSender() {
    _isSendLiveLocation = false;
  }

  @action
  _updateCurrentLocation(LatLong target) async {
    while (_isSendLiveLocation) {
      await Future.delayed(const Duration(seconds: 5));
      debugPrint("liveLocation from Store");
      var position = await _locationService.getCurrentLocation();
      var cl = LatLng(position.latitude, position.longitude);
      _repository.updateCurrentLocation(
          LatLong(lat: cl.latitude, lng: cl.longitude),
          rideNavigationData.customerId,
          rideNavigationData.driverId);
      points = {
        Marker(
          markerId: MarkerId(cl.hashCode.toString()),
          position: LatLng(cl.latitude, cl.longitude),
          icon: _carBitMap,
        )
      };
    }
  }

  onNavigate() async {
    var isRunning = await rideDirectionNavigationService.runService();
    if (isRunning) {
      var isSuccessful = await _directionImpl.openDirectionView(
          rideNavigationData.data.pickUpLocation.lat,
          rideNavigationData.data.pickUpLocation.lng);
      if (!isSuccessful) {
        messageInformer.informUi("Unable to open map direction, Try again.");
      }
    } else {
      messageInformer.informUi("Unable to open direction service.");
    }
  }

  onCancelRide() {
    _disposers.add(_repository.onCancelRide().stream.listen((res) {
      if (res.isCanceled) {
        messageInformer.informUi(res.msg);
        stopLocationSender();
        onChange(ScreenWithExtras(screen: Screen.dashBoard));
      }
    }));
  }

  @action
  onClientLocated() {
    _repository.onRide(
        RideInstruction.clientLocated.key, rideNavigationData.tripId);
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

  @action
  onVerifiedOtp(Object? result) {
    if (result != null && result is bool && result) {
      /*_repository.onRide(
          RideInstruction.startTrip.key, rideNavigationData.tripId);*/
      currentRideStage = RideStages.ongoing;
      tripStartLoader = false;
    }
  }

  @action
  placeDropCoordinates(RideLocationResponse response) async {
    var locations = <LatLng>[];
    if (response.waypoints.isEmpty) {
      locations.add(rideNavigationData.currentLocation);
    }
    for (var element in response.waypoints) {
      locations.add(LatLng(element.lat, element.lng));
    }
    locations.add(LatLng(response.destination.lat, response.destination.lng));
    debugPrint(
        "dropNavigationInSetter ${response.destination.lat} ${response.destination.lng}");
    dropDirectionResponse =
        await google.Directions(env.googleApiKey).process(locations);
    debugPrint("dropNavigationDirectionResponse $dropDirectionResponse");
    lines = {};
    points = {};
    if (dropDirectionResponse != null) {
      var route = dropDirectionResponse!.routes.first;
      destinations.clear();
      _decodeLeg(route.legs.first, false);
      for (var leg in route.legs) {
        _decodeLeg(leg, true);
      }

      lines = {
        Polyline(
            width: 6,
            endCap: Cap.roundCap,
            startCap: Cap.roundCap,
            jointType: JointType.round,
            polylineId: PolylineId(
                dropDirectionResponse!.polylineDecoded.hashCode.toString()),
            points: dropDirectionResponse!.polylineDecoded!)
      };

      var markers = <Marker>{};

      markers.add(Marker(
          markerId: MarkerId(locations.last.hashCode.toString()),
          anchor: const Offset(0.5, 0.5),
          position: locations.last,
          icon: _destinationBitMap,
          onTap: () {
            _onDestinationMarkerTaped(locations.last);
          }));

      for (var location in locations) {
        if (location != locations.last) {
          markers.add(Marker(
              markerId: MarkerId(location.hashCode.toString()),
              position: location,
              anchor: const Offset(0.5, 0.5),
              icon: _wayPointBitMap,
              onTap: () {
                _onWaypointTaped(location);
              }));
        }
      }

      points = markers;
    }
  }

  @action
  _onDestinationMarkerTaped(LatLng last) {}

  @action
  _onWaypointTaped(LatLng location) {}

  @observable
  ObservableList<RideStop> destinations = ObservableList.of([]);

  @action
  _decodeLeg(google.Leg leg, bool isEnd) {
    var address = isEnd ? leg.endAddress : leg.startAddress;
    var lat = isEnd ? leg.endLocation.lat : leg.startLocation.lat;
    var lng = isEnd ? leg.endLocation.lng : leg.startLocation.lng;
    destinations.add(RideStop(name: address, location: LatLng(lat, lng)));
  }

  onEndTrip() {
    _repository.onRide(RideInstruction.endTrip.key, rideNavigationData.tripId);
    onChange(ScreenWithExtras(
        screen: Screen.payTrip,
        option: NavigationOption(option: Option.popPrevious),
        argument: RideIds(
            rideId: rideNavigationData.tripId,
            driverId: rideNavigationData.driverId,
            customerName: customer)));
  }

  @action
  endTripWaiting() async {
    endTripLoader = false;
    await Future.delayed(const Duration(seconds: 1));
    endTripLoader = true;
  }

  onRideStopNavigateTapped(RideStop stop) async {
    var isRunning = await rideDirectionNavigationService.runService();
    if (isRunning) {
      var isSuccessful = await _directionImpl.openDirectionView(
          stop.location.latitude, stop.location.longitude);
      if (!isSuccessful) {
        messageInformer.informUi("Unable to open map direction, Try again.");
      }
    } else {
      messageInformer.informUi("Unable to direction service.");
    }
  }

  _listenEvents() {
    rideDirectionNavigationService.eventPort?.listen((event) {
      log("onEventPort $event");
      if (event is TimeStampWithDirection) {
      } else if (event is ScreenWithExtras) {
      } else if (event is String) {
      } else {}
    });
  }

  onRideStopTapped(RideStop stop) {
    _controller?.animateCamera(CameraUpdate.newLatLngZoom(stop.location, 20));
  }
}
