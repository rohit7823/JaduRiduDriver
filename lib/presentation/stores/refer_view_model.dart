

import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/alert_option.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/driver_refer_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../ui/string_provider.dart';

part 'refer_view_model.g.dart';

class ReferStore = _ReferViewModel with _$ReferStore;

abstract class _ReferViewModel with Store{
  final _repository = dependency<DriverReferRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool isLoading = false;

  @observable
  int driverToDriver = 0;

  @observable
  int driverToCustomer = 0;

  @observable
  String driverToDriverReferCode = "";

  @observable
  String driverToCustomerReferCode = "";

  @observable
  String msg= "";

  _ReferViewModel(){
    _initialData();
  }

  @action
  _initialData() async {
    isLoading = true;
    var userId = _storage.userId();
    var response = await _repository.getDriverReferInittialData(userId);
    debugPrint(response.toString());
    if(response is Success){
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          msg = data!.message;
          driverToDriver = data.driverRefers.driverToDriver;
          driverToCustomer = data.driverRefers.driverToCustomar;
          driverToDriverReferCode = data.driverRefers.driverToDriverReferCode;
          driverToCustomerReferCode = data.driverRefers.driverToCustomarReferCode;

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
                  action: AlertAction.welcomeJaduRideInitialData)));
      }
    }else if (response is Error) {
      isLoading = false;
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
              action: AlertAction.welcomeJaduRideInitialData)));
    }
  }

}