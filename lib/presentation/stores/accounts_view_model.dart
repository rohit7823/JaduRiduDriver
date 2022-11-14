import 'package:flutter/material.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/repository/accounts_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:mobx/mobx.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import '../../core/helpers/storage.dart';
import '../../utills/my_utils.dart';

part 'accounts_view_model.g.dart';

class AccountsStore = _AccountsViewModels with _$AccountsStore;

abstract class _AccountsViewModels extends AppNavigator with Store {
  final _repository = dependency<AccountsRepository>();
  final _prefs = dependency<Storage>();

  @observable
  bool isLoading = false;

  @observable
  String balanceLow = "";

  @observable
  String onlinePrice = "";

  @observable
  String cashPrice = "";

  @observable
  String currentBalance = "";

  @action
  getAcctountSummeryData() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.getAccountSummery(userId);
    //debugPrint("MyData"+response.data.toString());
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.accountSummery.isLow) {
            balanceLow = "My balance is low";
          } else {
            balanceLow = "";
          }
          onlinePrice = data.accountSummery.onlineCollected;
          cashPrice = data.accountSummery.cashCollected;
          currentBalance = data.accountSummery.currentKm;
      }
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }

  //current balance click........
  onCurrentBalance() {
    onChange(ScreenWithExtras(
        screen: Screen.currentBalanceDetails, argument: currentBalance));
  }

  //todays payment click.........
  onTodaysPayment() {
    onChange(ScreenWithExtras(
        screen: Screen.todaysPaymentScreen));
  }

  //payment summery click.........
  onPaymentSummery() {
    onChange(ScreenWithExtras(
        screen: Screen.paymentSummeryScreen));
  }

  //click amount transferred by date...................
  onAmountTransfferedByDay() {
    onChange(ScreenWithExtras(
        screen: Screen.amountTransfferedByDayScreen));
  }
}
