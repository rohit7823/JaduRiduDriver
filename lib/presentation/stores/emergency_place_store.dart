import 'package:jadu_ride_driver/core/domain/emergency_place.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/app_navigation/sereen_argument_models/emergency_screen_argument.dart';
import 'package:mobx/mobx.dart';

import '../../core/repository/emergency_place_repository.dart';

part 'emergency_place_store.g.dart';

class EmergencyPlaceStore = _IEmergencyPlaceStore with _$EmergencyPlaceStore;

abstract class _IEmergencyPlaceStore with Store {
  final _repository = dependency<EmergencyPlaceRepository>();

  @observable
  EmergencyPlace? destination;

  @observable
  Object? origin;

  EmergencyScreenArgument screenData;

  @observable
  int? scrollToIdx;

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

  @action
  onProceed() async {}
}
