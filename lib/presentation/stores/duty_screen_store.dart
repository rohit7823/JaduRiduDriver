import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/driver_status.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/driver_duty_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/app_location_service.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/argument.dart';
import '../../core/common/navigate_from.dart';
import '../../core/domain/expired_document_alert.dart';
import '../ui/string_provider.dart';

part 'duty_screen_store.g.dart';

class DutyStore = _DutyScreenStore with _$DutyStore;

abstract class _DutyScreenStore extends AppNavigator with Store {
  final _storage = dependency<Storage>();
  final _repository = dependency<DriverDutyRepository>();
  final dialogManager = DialogManager();
  final alertDialogManager = DialogManager();
  final _locationService = AppLocationService();

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

  @observable
  String notificationStatus = "";

  @observable
  String? selectedGoToLocation;

  @action
  _DutyScreenStore(this.tabController) {
    _driverStatus();
    _getBookingSummary();
    selectedGoToLocation = _storage.selectedGoToLocation();
  }

  _driverStatus() async {
    var userId = _storage.userId();
    var response = await _repository.driverStatus(userId);
    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          for (var element in DriverStatus.values) {
            if (element.name == data!.currentStatus) {
              selectedStatus = element;
              print("$selectedStatus");
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
    tabController.animateTo(selectedStatus.index);
  }

  @action
  onDriverStatusChanged(int idx) async {
    if (idx == DriverStatus.goTo.index) {
      var currentPos = await _locationService.getCurrentLocation();
      var currentLocation = LatLon(currentPos.latitude, currentPos.longitude);
      onChange(ScreenWithExtras(
          screen: Screen.selectLocation,
          argument: currentLocation,
          option: NavigationOption(option: Option.none)));
    } else {
      selectedGoToLocation = null;
      await _storage.removeSelectedGoToLocation();
      await changeDriverStatus(idx);
      _storage.setDriverStatus(DriverStatus.values.elementAt(idx).name);
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.documentExpired) {
      _navigateToAddedDetails();
    }
  }

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
          bookingCount = '${data!.bookingCount}';
          operatorBill = '${data.operatorBill}';
          debugPrint("data.updateDateTime ${data.updateDateTime}");
          timeStamp = data.updateDateTime;
          break;
        default:
          bookingCount = "0";
          operatorBill = "0.0";
          String timeStamp = "Thus, 01 Jun 22, 06:37 PM";
          errorMsg = data?.message ?? "";
      }
    } else if (response is Error) {
      gettingSummaryLoader = false;
      errorMsg = response.message ?? "";
    }
  }

  onNotificationScreen() {
    onChange(ScreenWithExtras(screen: Screen.notification));
  }

  @action
  changeDriverStatus(int idx,
      {String? goToLocationTxt, Location? goToLocation}) async {
    var selectedStatus = DriverStatus.values.elementAt(idx);
    var userId = _storage.userId();
    var goToDetails = json.encode({
      "address": goToLocationTxt,
      "lat": goToLocation?.lat,
      "lng": goToLocation?.lng
    });
    var response =
        await _repository.setStatus(userId, selectedStatus.name, goToDetails);

    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.isUpdated) {
            //_storage.setDriverStatus(selectedStatus.name);
            _changeStatus(selectedStatus);
            if(goToLocationTxt != null) {
              selectedGoToLocation = goToLocationTxt;
              _storage.setGoToLocation(goToLocationTxt);
            }
            if (data.documentAlert.giveAlert) {
              debugPrint("documentAlert ${data.documentAlert.keys}");
              _documentAlert = data.documentAlert;
              alertDialogManager.initErrorData(AlertData(
                  StringProvider.appName,
                  null,
                  StringProvider.appId,
                  data.documentAlert.message,
                  StringProvider.reSubmit,
                  StringProvider.skip.toUpperCase(),
                  null,
                  AlertBehaviour(
                      option: AlertOption.none,
                      action: AlertAction.documentExpired,
                      isDismissable: data.documentAlert.isSkippable)
              ));
            }
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

  @action
  setGoToLocation(DetailsResult? location) {
    var selected = _storage.driverStatus();
    debugPrint("_selectedStatusIdx $selected");
    if (location != null) {
      changeDriverStatus(
          DriverStatus.goTo.index,
          goToLocationTxt: location.formattedAddress,
          goToLocation: location.geometry?.location
      );
    } else {
      if (selected.isNotEmpty) {
        debugPrint("statusChanging $location");
        for (var e in DriverStatus.values) {
          if (e.name == selected) {
            _changeStatus(DriverStatus.values.elementAt(e.index));
          }
        }
      }
    }
  }

  @action
  _changeStatus(DriverStatus selectedStatus) {
    tabController.animateTo(selectedStatus.index);
    this.selectedStatus = selectedStatus;
  }

  ExpiredDocumentAlert? _documentAlert;

  void _navigateToAddedDetails() {
    onChange(ScreenWithExtras(
        screen: Screen.addAllDetails,
        argument: Argument(
            navigateFrom: NavigateFrom.duty,
            data: _documentAlert
        )
    ));
  }
}
