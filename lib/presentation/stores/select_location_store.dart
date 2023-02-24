import 'package:google_place/google_place.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/helpers_impls/app_location_service.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:jadu_ride_driver/utills/directions.dart';
import 'package:jadu_ride_driver/utills/environment.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/screen.dart';

part 'select_location_store.g.dart';

class SelectLocationStore = _ISelectLocationStore with _$SelectLocationStore;

abstract class _ISelectLocationStore extends AppNavigator with Store {
  late final LatLon location;
  late final GooglePlace _placesApi;
  final _env = dependency<Environment>();
  final dialogManager = DialogManager();

  @observable
  bool loader = false;

  @observable
  String searchQuery = "";

  @observable
  String? noDataNotify = "";

  @observable
  AutocompletePrediction? selected;

  @observable
  ObservableList<AutocompletePrediction> predictions = ObservableList.of([]);

  _ISelectLocationStore(LatLon currentLocation) {
    _placesApi = GooglePlace(_env.googleApiKey);
    location = currentLocation;
  }

  @action
  onSearchQuery(String query) async {
    if (query.isNotEmpty) {
      var response = await _placesApi.autocomplete.get(query,
          location: location,
          radius: 5000,
          components: [Component("country", "ind")],
          types: "geocode",
          origin: location);
      switch (response != null && response.status == 'OK') {
        case true:
          if (response?.predictions?.isNotEmpty == true) {
            predictions.clear();
            var values = response?.predictions;
            if (values != null) {
              predictions.addAll(values);
              noDataNotify = null;
            }
          } else {
            predictions.clear();
            noDataNotify = "No predictions found.";
          }
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              "Error happens on result:\n${response?.status}",
              StringProvider.okay,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none,
                  action: AlertAction.placesApiError)));
      }
    }
    else {
      predictions.clear();
    }
  }

  @action
  onSelectPrediction(AutocompletePrediction prediction) {
    selected = prediction;
  }

  @action
  onDone(AutocompletePrediction prediction) async {
    loader = true;
    var response = await _placesApi.details.get(prediction.placeId!);
    loader = false;
    switch(response != null && response.status == "OK") {
      case true:
        onChange(
            ScreenWithExtras(
            screen: Screen.dashBoard,
            argument: response?.result,
            option: NavigationOption(
                option: Option.none
            ))
        );
        break;
      default:
    }
  }
}
