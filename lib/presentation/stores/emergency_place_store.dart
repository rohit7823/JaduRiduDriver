import 'package:jadu_ride_driver/core/domain/emergency_place.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/sereen_argument_models/emergency_screen_argument.dart';
import 'package:mobx/mobx.dart';

part 'emergency_place_store.g.dart';

class EmergencyPlaceStore = _IEmergencyPlaceStore with _$EmergencyPlaceStore;

abstract class _IEmergencyPlaceStore with Store {
  @observable
  EmergencyPlace? destination;

  @observable
  Object? origin;

  EmergencyScreenArgument screenData;

  @observable
  int scrollToIdx = 0;

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
  }
}
