import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/app_language_codes.dart';
import 'package:jadu_ride_driver/core/common/app_languages.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/change_app_language_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/current_locale.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'change_app_language_screen_store.g.dart';

class ChangeAppLanguageStore = _ChangeAppLanguageScreenStore
    with _$ChangeAppLanguageStore;

abstract class _ChangeAppLanguageScreenStore extends AppNavigator with Store {
  final _repository = dependency<ChangeAppLanguageRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  Map<AppLanguageCode, AppLanguage> locales = {};

  @observable
  AppLanguageCode selectedAppLocale = AppLanguageCode.english;

  @observable
  bool enableBtn = false;

  @observable
  bool sendingLoader = false;

  @observable
  String languageChangedMsg = "";

  _ChangeAppLanguageScreenStore() {
    _mapLangAndCodes();
  }

  _mapLangAndCodes() {
    if (AppLanguage.values.length == AppLanguageCode.values.length) {
      for (var element in AppLanguage.values) {
        switch (element) {
          case AppLanguage.english:
            locales.addAll({AppLanguageCode.english: element});
            break;
          case AppLanguage.hindi:
            locales.addAll({AppLanguageCode.hindi: element});
            break;
          case AppLanguage.bengali:
            locales.addAll({AppLanguageCode.bengali: element});
            break;
          case AppLanguage.marathi:
            //locales.addAll({AppLanguageCode.marathi: element});
            break;
          case AppLanguage.nepali:
            //locales.addAll({AppLanguageCode.nepali: element});
            break;
          case AppLanguage.sindhi:
            //locales.addAll({AppLanguageCode.sindhi: element});
            break;
        }
      }
    }
  }

  @action
  void setCurrentLocale(BuildContext context) {
    selectedAppLocale = CurrentLocale(context).getLocaleCode();
  }

  @action
  onLocaleClick(AppLanguageCode selected) {
    selectedAppLocale = selected;
    debugPrint("selected locale: ${selectedAppLocale.value}");
  }

  @action
  onNext({required Function changeLang}) async {
    sendingLoader = true;
    enableBtn = true;
    var userId = _storage.userId();
    var response =
        await _repository.updateLanguage(userId, selectedAppLocale.value);
    if (response is Success) {
      var data = response.data;
      sendingLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isUpdated) {
            await changeLang();
            languageChangedMsg = StringProvider.languageChangedSuccessfully;
            enableBtn = false;
            onChange(ScreenWithExtras(screen: Screen.welcomeJaduRide));
          } else {
            enableBtn = false;
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.okay,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.none, action: AlertAction.none)));
          }
          break;
        default:
          enableBtn = false;
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.okay,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none, action: AlertAction.none)));
      }
    } else if (response is Error) {
      sendingLoader = false;
      enableBtn = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.okay,
          null,
          null,
          AlertBehaviour(option: AlertOption.none, action: AlertAction.none)));
    }
  }
}
