import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/driver_duty_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/google_map_direction_impl.dart';
import 'package:jadu_ride_driver/main.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:jadu_ride_driver/utills/environment.dart';
import 'package:mobx/mobx.dart';

part 'duty_screen_store.g.dart';

class DutyStore = _DutyScreenStore with _$DutyStore;

abstract class _DutyScreenStore with Store {
  final _storage = dependency<Storage>();
  final _repository = dependency<DriverDutyRepository>();
  final dialogManager = DialogManager();

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

  @observable
  bool gettingSummaryLoader = false;

  @observable
  String informMessage = "";

  _DutyScreenStore(this.tabController) {
    _driverStatus();
    _getBookingSummary();
  }

  _driverStatus() async {
    var currentStatus = _storage.driverStatus();
    log("CurrentStatus $currentStatus");
    if (currentStatus.isNotEmpty) {
      for (var element in DriverStatus.values) {
        if (element.name == currentStatus) {
          selectedStatus = element;
          break;
        }
      }
    } else {
      var userId = _storage.userId();
      var response = await _repository.driverStatus(userId);
      if (response is Success) {
        var data = response.data;
        switch (data != null && data.status) {
          case true:
            for (var element in DriverStatus.values) {
              if (element.name == data!.driverStatus.status) {
                selectedStatus = element;
                _storage.setDriverStatus(selectedStatus.name);
                break;
              }
            }
            break;
          default:
            errorMsg = data?.message ?? "";
        }
      } else if (response is Error) {
        errorMsg = response.message ?? "";
      }
    }

    tabController.animateTo(selectedStatus.index);
  }

  @action
  onDriverStatusChanged(int idx) async {
    var selectedStatus = DriverStatus.values.elementAt(idx);
    var userId = _storage.userId();

    var response = await _repository.setStatus(userId, selectedStatus.name);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isUpdated) {
            _storage.setDriverStatus(selectedStatus.name);
            this.selectedStatus = selectedStatus;
            informMessage = data.message;
          } else {
            errorMsg = data.message;
          }
          break;
        default:
          errorMsg = data?.message ?? "";
      }
    } else if (response is Error) {
      errorMsg = response.message ?? "";
    }
  }

  onError(AlertAction? action) {}

  @action
  _getBookingSummary() async {
    gettingSummaryLoader = true;
    var userId = _storage.userId();
    var response = await _repository.bookingsSummary(userId);
    if (response is Success) {
      var data = response.data;
      gettingSummaryLoader = false;
      switch (data != null && data.status) {
        case true:
          bookingCount = data!.bookingsSummary.bookingCount;
          operatorBill = data.bookingsSummary.totalIncome;
          timeStamp = data.bookingsSummary.timeStamp;
          break;
        default:
          bookingCount = "0";
          operatorBill = "0.0";
          timeStamp = "";
          errorMsg = data?.message ?? "";
      }
    } else if (response is Error) {
      gettingSummaryLoader = false;
      errorMsg = response.message ?? "";
    }
  }
}
