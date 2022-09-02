import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/details_step_key.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
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

  @observable
  bool clearingLoader = false;

  String get userName => _storage.name();

  @observable
  bool gettingDataLoader = false;

  @observable
  List<DetailStep> requiredSteps = [];

  @observable
  List<DetailStep> optionalSteps = [];

  @observable
  String informMessage = "";

  @observable
  bool continueBtn = false;

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
                  option: AlertOption.invokeOnBarrier,
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
    } else if (action == AlertAction.detailsCancel) {
      onCancelReset();
    }
  }

  profileSettingClicked() {
    onChange(ScreenWithExtras(screen: Screen.profileSettings));
  }

  onClicked(DetailStep step) {
    if (step.key == DetailsStepKey.identifyDetails.key) {
      onChange(ScreenWithExtras(screen: Screen.identifyDetails));
    } else if (step.key == DetailsStepKey.vehicleAudit.key) {
      onChange(ScreenWithExtras(screen: Screen.vehicleAudit));
    } else if (step.key == DetailsStepKey.vehiclePermit.key) {
      onChange(ScreenWithExtras(screen: Screen.vehiclePermit));
    } else if (step.key == DetailsStepKey.panCard.key) {
      onChange(ScreenWithExtras(screen: Screen.panCard));
    } else if (step.key == DetailsStepKey.vehicleInsurance.key) {
      onChange(ScreenWithExtras(screen: Screen.vehicleInsurance));
    } else if (step.key == DetailsStepKey.registrationCertificate.key) {
      onChange(ScreenWithExtras(screen: Screen.registrationCertificate));
    } else if (step.key == DetailsStepKey.profilePicture.key) {
      onChange(ScreenWithExtras(screen: Screen.profilePicture));
    } else if (step.key == DetailsStepKey.aadharCard.key) {
      onChange(ScreenWithExtras(screen: Screen.aadharCard));
    } else if (step.key == DetailsStepKey.driverLicense.key) {
      onChange(ScreenWithExtras(screen: Screen.driverLicense));
    } else if (step.key == DetailsStepKey.paymentDetails.key) {
      onChange(ScreenWithExtras(screen: Screen.paymentDetails));
    } else if (step.key == DetailsStepKey.vehiclePollution.key) {
      onChange(ScreenWithExtras(screen: Screen.vehiclePollution));
    }
  }

  refreshData(Object? flag) {
    if (flag != null) {
      getInitialData();
    }
  }

  onContinue() {
    var completes = <bool>[];
    for (var element in requiredSteps) {
      if (element.isComplete) {
        completes.add(element.isComplete);
      }
    }

    if (requiredSteps.length == completes.length) {
      onChange(ScreenWithExtras(
          screen: Screen.applicationSubmitted,
          option: NavigationOption(option: Option.popAll)));
    } else {
      informMessage = StringProvider.youHaveToCompleteRequiredFields;
    }
  }

  @action
  onCancelReset() async {
    clearingLoader = true;
    continueBtn = true;
    var userId = _storage.userId();
    var response = await _repository.resetDetails(userId);

    if (response is Success) {
      var data = response.data;
      continueBtn = false;
      clearingLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isAllCleared) {
            getInitialData();
          } else {
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.retry,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.none,
                    action: AlertAction.detailsCancel)));
          }
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.invokeOnBarrier,
                  action: AlertAction.detailsCancel)));
      }
    } else if (response is Error) {
      continueBtn = false;
      clearingLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.invokeOnBarrier,
              action: AlertAction.detailsCancel)));
    }
  }
}
