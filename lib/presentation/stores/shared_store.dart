import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/booking_status.dart';
import 'package:jadu_ride_driver/core/common/bottom_menus.dart';
import 'package:jadu_ride_driver/core/common/gps_status.dart';
import 'package:jadu_ride_driver/core/common/location_permission_status.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/intro_data.dart';
import 'package:jadu_ride_driver/core/domain/login_registration_data.dart';
import 'package:jadu_ride_driver/core/domain/response/intro_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/login_register_data_response.dart';
import 'package:jadu_ride_driver/core/domain/ride_navigation_data.dart';
import 'package:jadu_ride_driver/core/domain/ride_initiate_data.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/batch_call_repository.dart';
import 'package:jadu_ride_driver/core/repository/driver_live_location_repository.dart';
import 'package:jadu_ride_driver/helpers_impls/app_location_service.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/driver_bookings_store.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/api_client_configuration.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:jadu_ride_driver/utills/global.dart';
import 'package:jadu_ride_driver/utills/socket_io.dart';
import 'package:mobx/mobx.dart';

part 'shared_store.g.dart';

class SharedStore = _SharedStore with _$SharedStore;

abstract class _SharedStore extends AppNavigator with Store {
  final _repository = dependency<BatchCallRepository>();
  final _driverLocationRepo = dependency<DriverLiveLocationRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();
  final _locationService = AppLocationService();
  late final DriverBookingStore driverBookings;

  @observable
  bool gettingIntroDataLoader = false;

  List<IntroData> introPageData = [];

  LoginRegistrationData? loginRegistrationData;

  @observable
  bool callSuccess = false;

  @observable
  bool gettingDataLoader = false;

  StreamSubscription? streamDisposer;

  Position? currentLocation;

  @observable
  int selectedMenu = 0;

  StreamSubscription<RideInitiateData>? rideDataSubcription;

  _SharedStore() {
    driverBookings = DriverBookingStore();
  }

  initiateBatchCall() {
    ApiClientConfiguration.mainConfiguration.baseUrl = _prefs.baseUrl();
    var isCmplt = _prefs.isIntroComplete();
    var isLogin = _prefs.isLogin();
    var userId = _prefs.userId();
    if (!isCmplt) {
      getIntroPageData();
    } else {
      if (isLogin && userId.isNotEmpty) {
        getDashBoardData();
      } else {
        getLoginRegistrationPageData();
      }
    }
  }

  @action
  getIntroPageData() async {
    gettingIntroDataLoader = true;
    var response = await _repository.getIntroPageData();
    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          var introDataResponse = data!.responses.first;
          gettingIntroDataLoader = false;
          if (introDataResponse is IntroDataResponse) {
            if (introDataResponse.status) {
              introPageData = introDataResponse.introData;
              onChange(ScreenWithExtras(
                  screen: Screen.introScreen,
                  option: NavigationOption(option: Option.popPrevious)));
            } else {
              dialogManager.initErrorData(AlertData(
                  StringProvider.error,
                  null,
                  StringProvider.appId,
                  introDataResponse.message,
                  StringProvider.retry,
                  null,
                  null,
                  null));
            }
          }
          break;
        default:
          gettingIntroDataLoader = false;
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data!.message,
              StringProvider.retry,
              null,
              null,
              null));
      }
    } else if (response is Error) {
      gettingIntroDataLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          null));
    }
  }

  onIntroError() {
    dialogManager.closeErrorDialog();
    getIntroPageData();
  }

  @action
  getLoginRegistrationPageData() async {
    gettingDataLoader = true;
    var response = await _repository.getLRPageData();
    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          var pageResponse = data?.responses.first;
          gettingDataLoader = false;
          if (pageResponse is LoginRegisterDataResponse) {
            if (pageResponse.status) {
              loginRegistrationData = pageResponse.data;
              loginRegistrationData!.coverImage =
                  "${Global.baseUrl}${loginRegistrationData!.coverImage}";
              onChange(
                  ScreenWithExtras(screen: Screen.loginRegistrationScreen));
            } else {
              dialogManager.initErrorData(AlertData(
                  StringProvider.error,
                  null,
                  StringProvider.appId,
                  pageResponse.message,
                  StringProvider.retry,
                  null,
                  null,
                  null));
            }
          }
          break;
        default:
          gettingDataLoader = false;
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              null));
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
          null));
    }
  }

  onLoginRegistrationRetry() {
    dialogManager.closeErrorDialog();
    getLoginRegistrationPageData();
  }

  @action
  getDashBoardData() async {
    gettingDataLoader = true;
    streamDisposer = _locationService.checkPermission().listen((event) async {
      if (event == GpsStatus.disabled) {
        gettingDataLoader = false;
        dialogManager.initData(AlertData(
            StringProvider.appName,
            null,
            StringProvider.appId,
            StringProvider.enableGpsMessage,
            StringProvider.okay,
            null,
            null,
            AlertBehaviour(
                option: AlertOption.invokeOnBarrier,
                isDismissable: false,
                action: AlertAction.enableGps)));
      } else if (event == LocationPermissionStatus.showRationale) {
        gettingDataLoader = false;
        dialogManager.initData(AlertData(
            StringProvider.appName,
            null,
            StringProvider.appId,
            StringProvider.permissionRationaleMessage,
            StringProvider.okay,
            null,
            null,
            AlertBehaviour(
                option: AlertOption.none,
                action: AlertAction.locationPermissionRationale)));
      } else if (event == LocationPermissionStatus.openSetting) {
        gettingDataLoader = false;
        dialogManager.initData(AlertData(
            StringProvider.appName,
            null,
            StringProvider.appId,
            StringProvider.locationDeniedForever,
            StringProvider.appSetting,
            null,
            null,
            AlertBehaviour(
                option: AlertOption.none, action: AlertAction.enableGps)));
      } else {
        currentLocation = await _locationService.getCurrentLocation();
        _sendCurrentLocation();
        gettingDataLoader = false;
        streamDisposer?.cancel();
        debugPrint(currentLocation.toString());
        onChange(ScreenWithExtras(
            screen: Screen.dashBoard,
            option: NavigationOption(option: Option.popAll)));
      }
    });
  }

  onAction(AlertAction? action) {
    if (action == AlertAction.enableGps) {
      _locationService.openSettings();
    } else if (action == AlertAction.locationServiceDisable) {
      _locationService.openSettings();
    }
  }

  locationStatus() {
    streamDisposer = _locationService.gpsStatusStream().listen((event) {
      if (event == ServiceStatus.disabled) {
        dialogManager.initData(AlertData(
            StringProvider.appName,
            null,
            StringProvider.appId,
            StringProvider.enableLocationMessage,
            StringProvider.okay,
            null,
            null,
            AlertBehaviour(
                option: AlertOption.invokeOnBarrier,
                isDismissable: false,
                action: AlertAction.locationServiceDisable)));
      }
    });
  }

  @action
  onBottomMenu(int index) {
    if (index != selectedMenu) {
      selectedMenu = index;
      ScreenWithExtras? screen;
      if (index == BottomMenus.duty.index) {
        screen = ScreenWithExtras(
            screen: Screen.duty,
            option: NavigationOption(option: Option.popPrevious));
      } else if (index == BottomMenus.accounts.index) {
        screen = ScreenWithExtras(
            screen: Screen.accounts,
            option: NavigationOption(option: Option.popPrevious));
      } else if (index == BottomMenus.incentives.index) {
        screen = ScreenWithExtras(
            screen: Screen.incentives,
            option: NavigationOption(option: Option.popPrevious));
      } else if (index == BottomMenus.partnerCare.index) {
        screen = ScreenWithExtras(
            screen: Screen.partnerCare,
            option: NavigationOption(option: Option.popPrevious));
      } else if (index == BottomMenus.schedule.index) {
        screen = ScreenWithExtras(
            screen: Screen.schedule,
            option: NavigationOption(option: Option.popPrevious));
      } else if (index == BottomMenus.more.index) {
        screen = ScreenWithExtras(
            screen: Screen.more,
            option: NavigationOption(option: Option.popPrevious));
      }

      if (screen != null) {
        onChange(screen);
      }
    }
  }

  _sendCurrentLocation() async {
    var driverId = _prefs.userId();
    Timer.periodic(const Duration(seconds: 30), (timer) async {
      var currentLocation = await _locationService.getCurrentLocation();
      await _driverLocationRepo.throwLiveLocation(driverId,
          LatLng(currentLocation.latitude, currentLocation.longitude));
    });
  }

  onPass(BookingStatus status) {
    driverBookings.onBookingPass(status);
  }

  @action
  onOkay(BookingStatus status) async {
    driverBookings.onBookingAccept(status);
  }

  afterAcceptBooking(RideInitiateData value) {
    onChange(ScreenWithExtras(
      screen: Screen.rideNavigation,
      argument: RideNavigationData(
          tripId: driverBookings.currentBookingId,
          driverId: _prefs.userId(),
          customerId: driverBookings.details?.id ?? "",
          data: value,
          currentLocation:
              LatLng(currentLocation!.latitude, currentLocation!.longitude)),
    ));
  }

  connectToSocket() {
    SocketIO.init(autoConnect: true, userId: _prefs.userId());
    driverBookings.afterBookingAcceptedListen();
  }
}
