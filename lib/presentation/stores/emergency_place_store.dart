import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/common/service.dart';
import 'package:jadu_ride_driver/core/common/socket_events.dart';
import 'package:jadu_ride_driver/core/domain/emergency_place.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/sereen_argument_models/emergency_screen_argument.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:jadu_ride_driver/utills/socket_io.dart';
import 'package:mobx/mobx.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import '../../core/common/screen.dart';
import '../../core/repository/emergency_place_repository.dart';

part 'emergency_place_store.g.dart';

class EmergencyPlaceStore = _IEmergencyPlaceStore with _$EmergencyPlaceStore;

abstract class _IEmergencyPlaceStore extends AppNavigator with Store {
  final _repository = dependency<EmergencyPlaceRepository>();
  final dialogMgr = DialogManager();
  final _prefs = dependency<Storage>();

  @observable
  EmergencyPlace? destination;

  @observable
  Object? origin;

  EmergencyScreenArgument screenData;

  @observable
  int? scrollToIdx;

  @observable
  bool enableBtn = false;

  @observable
  bool bookingLoader = false;

  _IEmergencyPlaceStore(this.screenData) {
    onSelectStarting(screenData.currentLocation);
  }

  @action
  onSelectEnding(EmergencyPlace? emergencyPlace) {
    if (emergencyPlace != null) {
      for (var element in screenData.emergencyPlaces) {
        if (element.id == emergencyPlace.id) {
          scrollToIdx = screenData.emergencyPlaces.indexOf(element);
          break;
        }
      }
    }
  }

  @action
  onSelectStarting(Object starting) {
    origin = starting;
  }

  @action
  onTapPlace(EmergencyPlace place) {
    destination = place;
    enableBtn = place.isOpen;
  }

  @action
  onProceed() async {
    bookingLoader = true;
    LatLng? from;
    if (origin is Position) {
      from =
          LatLng((origin as Position).latitude, (origin as Position).longitude);
    } else if (origin is EmergencyPlace) {
      from = LatLng((origin as EmergencyPlace).coordinates.lat,
          (origin as EmergencyPlace).coordinates.lat);
    }

    var to = LatLng(destination!.coordinates.lat, destination!.coordinates.lng);

    var response = await _repository.initiateRide(from!, to, [],
        JaduService.toName(JaduService.Emergency), _prefs.userId());

    if (response is Success) {
      var data = response.data;
      bookingLoader = false;
      switch (data != null && data.status) {
        case true:
          SocketIO.client.emit(SocketEvents.initiateRide.value, data!.rideId);
          onChange(ScreenWithExtras(screen: Screen.dashBoard));
          break;
        default:
          dialogMgr.initErrorData(AlertData(
              StringProvider.appName,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none,
                  action: AlertAction.initiateBooking)));
      }
    } else if (response is Error) {
      bookingLoader = false;
      dialogMgr.initErrorData(AlertData(
          StringProvider.appName,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none, action: AlertAction.initiateBooking)));
    }
  }

  onRetry(AlertAction? action) {
    if (action == AlertAction.initiateBooking) {
      onProceed();
    }
  }
}
