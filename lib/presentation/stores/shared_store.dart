import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/intro_data.dart';
import 'package:jadu_ride_driver/core/domain/login_registration_data.dart';
import 'package:jadu_ride_driver/core/domain/response/intro_data_response.dart';
import 'package:jadu_ride_driver/core/domain/response/login_register_data_response.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/batch_call_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:jadu_ride_driver/utills/global.dart';
import 'package:mobx/mobx.dart';

part 'shared_store.g.dart';

class SharedStore = _SharedStore with _$SharedStore;

abstract class _SharedStore extends AppNavigator with Store {
  final _repository = dependency<BatchCallRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool gettingIntroDataLoader = false;

  List<IntroData> introPageData = [];

  LoginRegistrationData? loginRegistrationData;

  @observable
  bool callSuccess = false;

  @observable
  bool gettingDataLoader = false;

  initiateBatchCall() {
    var isCmplt = _prefs.isIntroComplete();
    var isLogin = _prefs.isLogin();
    var userId = _prefs.userId();
    if (!isCmplt) {
      getIntroPageData();
    } else {
      if (isLogin && userId.isNotEmpty) {
        getDashBoardData();
      } else {
        getRegistrationPageData();
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

  getDashBoardData() async {}

  getRegistrationPageData() async {}
}
