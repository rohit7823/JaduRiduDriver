import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/audit_step.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_audit_step.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/vehicle_audit_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/car_inside_store.dart';
import 'package:jadu_ride_driver/presentation/stores/chasis_number_screen_store.dart';
import 'package:jadu_ride_driver/presentation/stores/left_side_exterior_store.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/stores/number_plate_store.dart';
import 'package:jadu_ride_driver/presentation/stores/right_side_exterior_store.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'vehicle_audit_screen_store.g.dart';

class VehicleAuditStore = _VehicleAuditScreenStore with _$VehicleAuditStore;

abstract class _VehicleAuditScreenStore extends AppNavigator with Store {
  final _repository = dependency<VehicleAuditRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  late final ChasisNumberStore _chasisNumberStore;
  late final NumberPlateStore _numberPlateStore;
  late final LSExteriorStore _lsExteriorStore;
  late final RSExteriorStore _rsExteriorStore;
  late final InsideCarStore _insideCarStore;

  _VehicleAuditScreenStore() {
    _chasisNumberStore = ChasisNumberStore();
    _numberPlateStore = NumberPlateStore();
    _lsExteriorStore = LSExteriorStore();
    _rsExteriorStore = RSExteriorStore();
    _insideCarStore = InsideCarStore();
  }

  @observable
  List<VehicleAuditStep> requiredSteps = [];

  @observable
  bool gettingDataLoader = false;

  @observable
  Store? requiredStore;

  @observable
  bool enableBtn = false;

  @observable
  String informMassage = "";

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
          enableBtn = requiredSteps.every((element) => element.isCompleted);
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
    if (step.stepKey == AuditStep.chasisNumberImage.key) {
      requiredStore = _chasisNumberStore;
    } else if (step.stepKey == AuditStep.backSideWithNumberPlate.key) {
      requiredStore = _numberPlateStore;
    } else if (step.stepKey == AuditStep.leftSideExterior.key) {
      requiredStore = _lsExteriorStore;
    } else if (step.stepKey == AuditStep.rightSideExterior.key) {
      requiredStore = _rsExteriorStore;
    } else if (step.stepKey == AuditStep.carInside.key) {
      requiredStore = _insideCarStore;
    }
  }

  @action
  onDone() {
    if (enableBtn) {
      informMassage = StringProvider.vehicleAuditCompleted;
      onChange(ScreenWithExtras(screen: Screen.addAllDetails, argument: true));
    }
  }
}
