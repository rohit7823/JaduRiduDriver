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
          if (data!.accountSummery.balanceLow) {
            balanceLow = "My balance is low";
          } else {
            balanceLow = "";
          }
          onlinePrice = data.accountSummery.onlineCollectPrice;
          cashPrice = data.accountSummery.cashCollectPrice;
          currentBalance = data.accountSummery.currentBalance;
      }
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }

  onCurrentBalance() {
    onChange(ScreenWithExtras(
        screen: Screen.currentBalanceDetails, argument: currentBalance));
  }
}
