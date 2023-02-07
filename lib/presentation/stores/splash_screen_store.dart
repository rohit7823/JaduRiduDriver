import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/batch_call_command.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/splash_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/modules/component_module.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/check_internet.dart';
import 'package:jadu_ride_driver/utills/connectivity_state.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'splash_screen_store.g.dart';

class SplashStore = _SplashScreenStore with _$SplashStore;

abstract class _SplashScreenStore with Store, CheckInternet {
  final _repository = dependency<SplashRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  ConnectivityState connectivityState = ConnectivityState.Neutral;

  @observable
  var packageInfo = PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown');

  @observable
  BatchCallCommand batchCall = BatchCallCommand.neutral;

  _SplashScreenStore() {
    _initPackageInfo();
    getBaseUrl();
    checkNow((connectivityState) {
      switch (connectivityState) {
        case ConnectivityState.Gained:
          getBaseUrl();
          _changeConnectivity(connectivityState);
          break;
        case ConnectivityState.Gone:
          _changeConnectivity(connectivityState);
          break;
        case ConnectivityState.Neutral:
          _changeConnectivity(connectivityState);
          break;
      }
    });
  }

  @action
  _changeConnectivity(ConnectivityState connectivityState) {
    this.connectivityState = connectivityState;
  }

  @action
  _initPackageInfo() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @action
  getBaseUrl() async {
    var response = await _repository.getBaseUrl();
    if (response is Success) {
      var data = response.data;

      switch (data != null && data.status) {
        case true:
          _prefs.saveBaseUrl(data!.baseUrl);
          _checkAppVersion();
          break;
        default:
          debugPrint("initError");
          dialogManager.initErrorData(AlertData(StringProvider.error,
              null,
              StringProvider.appId,
              data!.message,
              StringProvider.retry,
              null, null, null));
      }
    } else if (response is Error) {
      dialogManager.initErrorData(AlertData(StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null, null, null));
    }
  }

  @action
  _checkAppVersion() async {
    var response = await _repository.fetchAppVersion();
    if (response is Success) {
      var data = response.data;

      switch (data != null && data.status) {
        case true:
          if (int.parse(packageInfo.buildNumber) < data!.version.code) {
            dialogManager.initData(AlertData(
                StringProvider.appUpdate,
                null,
                StringProvider.appId,
                data.version.message,
                StringProvider.okay,
                StringProvider.notYet,
                null,
                data.version)
            );
          } else {
            batchCall = BatchCallCommand.initiate;
          }
      }
    }
  }

  appUpdatePostpone() {
    dialogManager.closeDialog();
  }

  onUpdateApp(String url) async {
    var isLaunched = await launchUrlString(url);
    //dialogManager.closeDialog();
    if(isLaunched) {
      debugPrint("$isLaunched");
    }
  }

  onErrorRetry() {
    dialogManager.closeErrorDialog();
    getBaseUrl();
  }
}
