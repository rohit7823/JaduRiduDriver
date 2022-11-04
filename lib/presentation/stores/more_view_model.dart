import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/driver_account_status.dart';
import 'package:jadu_ride_driver/core/common/navigate_from.dart';
import 'package:jadu_ride_driver/core/common/profile_short_description.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/navigation_option.dart';
import '../../core/common/response.dart';
import '../../core/common/screen_wtih_extras.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/profile_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/my_utils.dart';

part 'more_view_model.g.dart';

class MoreViewModels = _Profile with _$MoreViewModels;

abstract class _Profile extends AppNavigator with Store {
  final _repository = dependency<ProfileRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool isLoading = false;

  @observable
  String driverName = "";

  @observable
  String imageURL = "";

  @action
  getShortProfileData() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.profileRequest(userId);
    //debugPrint("MyData"+response.data.toString());
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          driverName = data!.driverShortProfile.driverName;
          imageURL = data.driverShortProfile.profileImagePath;

          break;
      }
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }

  //profile click.......
  onProfileDetails() {
    onChange(ScreenWithExtras(
      screen: Screen.profileDetailsScreen,
      argument: ProfileShortDescription(
          driverName: driverName, driverImageURL: imageURL),
    ));
  }

  //wallet click.......
  onWallet() {
    onChange(ScreenWithExtras(
        screen: Screen.currentBalanceDetails, argument: "300"));
  }

  //payment click.......
  onPaymentDetailsScreenRef() {
    onChange(ScreenWithExtras(screen: Screen.paymentDetails));
  }

  //selected language click.......
  onSelectedLanguage() {
    onChange(ScreenWithExtras(
        screen: Screen.changeLanguage,
        argument: NavigateFrom.moreScreen,
        option: NavigationOption(option: Option.none)));
  }

  //current balance click.......
  onRefer() {
    onChange(ScreenWithExtras(
      screen: Screen.referScreen,
    ));
  }

  //terms and conditions................................
  onTermsAndConditions() {
    onChange(ScreenWithExtras(
      screen: Screen.termsAndConditionsScreen,
    ));
  }

  //Privacy Policy..........................................
  onPrivacyPolicy() {
    onChange(ScreenWithExtras(
      screen: Screen.privacyPolicyScreen,
    ));
  }

  //refund Policy..........................................
  onRefundPolicy() {
    onChange(ScreenWithExtras(
      screen: Screen.refundPolicyScreen,
    ));
  }

  //help..........................................
  onHelp() {
    onChange(ScreenWithExtras(
      screen: Screen.helpScreen,
    ));
  }

  //emergency support..........................................
  onEmergencySupport() {
    onChange(ScreenWithExtras(
      screen: Screen.emergencySupportScreen,
    ));
  }

  //trips Details..........................................
  onTripDetails() {
    onChange(ScreenWithExtras(
      screen: Screen.tripsScreen,
    ));
  }

  //log out.......................................
  onLogout() {
    dialogManager.initData(AlertData(
        StringProvider.appName,
        null,
        StringProvider.appId,
        StringProvider.areYouReallyWantToLogout,
        StringProvider.Yes,
        null,
        null,
        AlertBehaviour(option: AlertOption.none, action: AlertAction.logout)));
  }

  logout(AlertAction? action) {
    if (action == AlertAction.logout) {
      _prefs.login(false);
      _prefs.saveUserId("");
      _prefs.setAccountStatus(DriverAccountStatus.accountUnknown.status);
      onChange(ScreenWithExtras(
          screen: Screen.loginRegistrationScreen,
          option: NavigationOption(option: Option.popAll)));
    }
  }

  closeLogoutDialog(AlertAction? action) {
    if (action == AlertAction.logout) {
      dialogManager.closeDialog();
    }
  }
}
