import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_audit_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'vehicle_audit_screen_store.g.dart';

class VehicleAuditStore = _VehicleAuditScreenStore with _$VehicleAuditStore;

abstract class _VehicleAuditScreenStore with Store {
  final _repository = dependency<VehicleAuditRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  List<VehicleAuditStep> requiredSteps = [];

  @observable
  bool gettingDataLoader = false;

  @observable
  VehicleAuditStep? selectedStep;

  @action
  getRequiredSteps() async {
    gettingDataLoader = true;
    var userId = _storage.userId();
    var response = await _repository.requiredSteps(userId);
    if (response is Success) {
      var data = response.data;
      gettingDataLoader = false;
      switch (data != null && data.status) {
        case true:
          requiredSteps = data!.steps;
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
                  action: AlertAction.auditRequiredSteps)));
      }
    } else if (response is Error) {
      gettingDataLoader = false;
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
              action: AlertAction.auditRequiredSteps)));
    }
  }

  @action
  onStepClicked(VehicleAuditStep step) {
    selectedStep = step;
  }
}
