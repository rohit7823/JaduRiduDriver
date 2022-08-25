import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/step.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/add_all_details_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'add_all_details_screen_store.g.dart';

class AddAllDetailsStore = _AddAllDetailsScreenStore with _$AddAllDetailsStore;

abstract class _AddAllDetailsScreenStore extends AppNavigator with Store {
  final _repository = dependency<AddAllDetailsRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  String get userName => _storage.name();

  @observable
  bool gettingDataLoader = false;

  @observable
  List<DetailStep> requiredSteps = [];

  @observable
  List<DetailStep> optionalSteps = [];

  _AddAllDetailsScreenStore() {
    getInitialData();
  }

  @action
  getInitialData() async {
    gettingDataLoader = true;
    var response = await _repository.initialData();
    if (response is Success) {
      var data = response.data;
      gettingDataLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.requiredSteps.isNotEmpty) {
            requiredSteps = data.requiredSteps;
          } else {
            dialogManager.initErrorData(AlertData(
                StringProvider.criticalError,
                null,
                StringProvider.appId,
                StringProvider.weAreFacingSomeError,
                StringProvider.retry,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.invokeOnBarrier,
                    action: AlertAction.allDetailsInitialData)));
          }
          optionalSteps = data.optionalSteps;
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.criticalError,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none,
                  action: AlertAction.allDetailsInitialData)));
      }
    } else if (response is Error) {
      gettingDataLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.criticalError,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none,
              action: AlertAction.allDetailsInitialData)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.allDetailsInitialData) {
      getInitialData();
    }
  }

  profileSettingClicked() {}
}
