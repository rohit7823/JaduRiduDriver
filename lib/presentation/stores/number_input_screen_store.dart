import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/image_assets.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/repository/number_input_repository.dart';

part 'number_input_screen_store.g.dart';

class NumberInputStore = _NumberInputScreenStore with _$NumberInputStore;

abstract class _NumberInputScreenStore extends AppNavigator with Store {
  final _repository = dependency<NumberInputRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool gettingDataLoader = false;

  @observable
  bool sendingLoader = false;

  @observable
  List<MobileNumberCode> codes = [];

  @observable
  String mobileNumber = "";

  String selectedCodeId = "";

  @observable
  bool enableBtn = false;

  _NumberInputScreenStore() {
    getNumberCodes();
    validateInput();
  }

  @action
  getNumberCodes() async {
    gettingDataLoader = true;
    var response = await _repository.getNumberCodes();
    if (response is Success) {
      var data = response.data;
      gettingDataLoader = false;
      switch (data != null && data.status) {
        case true:
          codes = data!.codes;
          selectedCodeId = data.codes.first.id;
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              Image.asset(ImageAssets.logo),
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
          Image.asset(ImageAssets.logo),
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          null));
    }
  }

  @action
  onNumberClear() {
    mobileNumber = "";
  }

  onCodeSelected(MobileNumberCode? code) {
    selectedCodeId = code!.id;
  }

  @action
  onNumberChange(String number) {
    mobileNumber = number;
  }

  @action
  onNext() async {
    sendingLoader = true;
    var number = mobileNumber.trim();
    var response = await _repository.sendOtp(number, selectedCodeId);
    if (response is Success) {
      var data = response.data;
      sendingLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isSend) {
            _storage.saveNumberCode(selectedCodeId);
            onChange(ScreenWithExtras(
                screen: Screen.verifyOtp,
                argument: number,
                option: NavigationOption(option: Option.popPrevious)));
          } else {
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.retry,
                null,
                null,
                AlertOption.none));
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
              AlertOption.none));
      }
    } else if (response is Error) {
      sendingLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertOption.none));
    }
  }

  onRetry() {
    onNext();
  }

  @action
  validateInput() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mobileNumber.length == 12) {
        enableBtn = true;
      } else {
        enableBtn = false;
      }
    }
  }
}
