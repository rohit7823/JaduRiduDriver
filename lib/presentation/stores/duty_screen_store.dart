import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/driver_duty_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:mobx/mobx.dart';

part 'duty_screen_store.g.dart';

class DutyStore = _DutyScreenStore with _$DutyStore;

abstract class _DutyScreenStore with Store {

  final _storage = dependency<Storage>();
  final _repository = dependency<DriverDutyRepository>();

  @observable
  String bookingCount = "0";

  @observable
  String operatorBill = "0.00";

  @observable
  String timeStamp = "Thus, 01 Jun 22, 06:37 PM";

  @observable
  DriverStatus selectedStatus = DriverStatus.onDuty;

  final TabController tabController;

  @observable
  String errorMsg = "";

  _DutyScreenStore(this.tabController) {
    _driverStatus();
  }

  _driverStatus() async {
    var currentStatus = _storage.driverStatus();
    if(currentStatus.isNotEmpty) {
      selectedStatus = DriverStatus.values.byName(currentStatus);
    } else {
      var userId = _storage.userId();
      var response = await _repository.driverStatus(userId);
      if(response is Success) {
        var data = response.data;
        switch(data != null && data.status) {
          case true:
            selectedStatus = DriverStatus.values.byName(data!.driverStatus.status);
            break;
          default:
            errorMsg = data?.message ?? "";
        }
      } else if(response is Error) {
        errorMsg = response.message ?? "";
      }
    }

    tabController.animateTo(selectedStatus.index);
  }

  @action
  onDriverStatusChanged(int idx) {
    selectedStatus = DriverStatus.values.elementAt(idx);
  }
}