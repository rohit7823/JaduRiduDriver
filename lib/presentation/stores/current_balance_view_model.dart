import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/constants.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/response/aboutwallet_response.dart';
import 'package:jadu_ride_driver/core/domain/response/get_current_balance_response.dart';
import 'package:jadu_ride_driver/core/helpers/razorpay_init.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/message_informer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../core/common/current_date_time.dart';
import '../../core/common/custom_radio_button.dart';
import '../../core/common/response.dart';

import '../../core/domain/package.dart';
import '../../core/helpers/storage.dart';
import 'package:mobx/mobx.dart';
import '../../core/repository/current_balance_repository.dart';
import '../../helpers_impls/date_time_helper.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../../utills/my_utils.dart';

part 'current_balance_view_model.g.dart';

class CurrentBalanceStore = _CurrentBalanceViewModel with _$CurrentBalanceStore;

abstract class _CurrentBalanceViewModel extends  AppNavigator   with Store {
  static const _walletOption = Constants.walletOption;
  final _repository = dependency<CurrentBalanceRepository>();
  final _prefs = dependency<Storage>();
  final msgInformer = MessageInformer();
  final dialogManager = DialogManager();
  final _dateTimeHelper = DateTimeHelper();
  RazorpayInit? _razorpayInit;



  final walletOption = _walletOption;

  @observable
  List<Datum> currentBalanceHistory =  [];


  List<Datum> currentBalanceHistorybackup = [];



  @observable
  Package? selectd;


  @observable
  List<Package> allDatesLists = [];





  // @observable
  // Package? selectedDates;
  //


  @observable
  bool isLoading = false;

  @observable
  bool datesSelectedListLoader = false;

  @observable
  String date = "";

  @action
  currentDate() {
    date = GetDateState.getCurrentDate();
  }

  openDatePicker() {
    dialogManager.openDatePicker();
  }

  @observable
  DriverTransactionType selected = DriverTransactionType.none;


  @observable
  bool openingPaymentGatewayLoader = false;

  @observable
  bool gettingWalletDetailsLoader = false;


  @observable
  WalletDetails? details;

  @observable
  String? amount;

  @observable
  var walletValue = "";

  @observable
  var updatable = false;

  @observable
  String Rmessage = '';




  @action
  onPaymentMethodSelected(String? value){

  }

  bool backToPrevious() {
    onChange(ScreenWithExtras(screen: Screen.accounts, argument: amount ?? ""));
    return false;
  }

  _CurrentBalanceViewModel() {
    retrieveWalletDetails();
  }




  @action
  onRadioSelected(DriverTransactionType? selectedValue) {
    if(selectedValue != null){
      selected = selectedValue;
      var temp = <Datum>[];
      for (var element in currentBalanceHistorybackup) {
        debugPrint('${selectedValue.name} ${element.rechargeType}');
        if(selectedValue.name == element.rechargeType) {
          temp.add(element);
        }
      }
      currentBalanceHistory = temp;
    }
  }



  @action
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      var dateFormat = DateFormat("${selected.year}-${selected.month}-${selected.day}");
      date = dateFormat.format(selected);
      debugPrint('daTE: $date');
      datelistItem();
    } else {
      currentDate();
    }
  }


  @action
  datelistItem() async {
    datesSelectedListLoader = true;
    var userId = _prefs.userId();
    var response = await _repository.allDatesResponse(userId, date);
    if (response is Success) {
      var data = response.data;
      datesSelectedListLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.data.isEmpty) {

            currentBalanceHistory =  [];
            currentBalanceHistorybackup = [];
           // MyUtils.toastMessage("Empty List....");
            // Rmessage = data.message;
            // msgInformer.informUi(data.message);
            // debugPrint('data.message');
          } else {
            currentBalanceHistory =  data.data;
            currentBalanceHistorybackup = data.data;
            onRadioSelected(DriverTransactionType.received);
            print("****");
            debugPrint('currentBalanceHistory: $currentBalanceHistory');
          }
      } //switch
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      datesSelectedListLoader = false;
    }
  }









  @action
  retrieveWalletDetails() async {
    gettingWalletDetailsLoader = true;
    //details = null;

    var response = await _repository.walletDetails(_prefs.userId());
    if (response is Success) {
      var data = response.data;
      gettingWalletDetailsLoader = false;
      switch (data != null && data.status) {
        case true:
          //details = data!.details;

          amount = data!.currentPurchasedKm;
          break;
        default:
          msgInformer.informUi(data?.message ?? "");
      }
    } else if (response is Error) {
      msgInformer.informUi(response.message ?? "");
    }
  }

  @action
  onClickRefillWallet() async {
    openingPaymentGatewayLoader = true;
    var response = await _repository.walletRechargeAmounts(_prefs.userId());
    log("recharAmount $response");
    if (response is Success) {
      var data = response.data;
      openingPaymentGatewayLoader = false;
      switch (data != null && data.status) {
        case true:
          selectd = data!.packages.first;
          dialogManager.initData(AlertData(
              StringProvider.balancetitle,
              null,
              StringProvider.appId,
              StringProvider.selectAnyAmountForRecharge,
              StringProvider.done,
              null,
              null,
              data.packages
          ));
          break;
        default:
          msgInformer.informUi(StringProvider.unableToOpenPaymentGateway);
      }
    } else if (response is Error) {
      openingPaymentGatewayLoader = false;
      msgInformer.informUi(StringProvider.someNetworkIssueisHappening);
    }
  }

  onSelectAmount(Package? selected) async {
    msgInformer.informUi(StringProvider.paymentGatewayOpening);
    var response = await _repository.fetchRazorpayData(_prefs.userId(), selected?.id ?? "");
    if (response is Success) {
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          _razorpayInit = RazorpayInit(
            options: data!.data,
            successNotify: _onPaymentSuccess,
            errorNotify: _onPaymentError,
            walletNotify: _onPaymentWallet,
          );
          break;
        default:
          msgInformer.informUi(StringProvider.unableToOpenPaymentGateway);
      }
    } else if (response is Error) {

      msgInformer.informUi(StringProvider.someNetworkIssueisHappening);
    }
  }

  _onPaymentSuccess (PaymentSuccessResponse response){
    onChange(ScreenWithExtras(screen: Screen.walletPaymentStatus, argument: response));
    retrieveWalletDetails();
    _razorpayInit!.dispose();

  }

  _onPaymentError(PaymentFailureResponse response){
    onChange(ScreenWithExtras(screen: Screen.walletPaymentStatus, argument: response));
    _razorpayInit!.dispose();
  }

  _onPaymentWallet(ExternalWalletResponse response){
    onChange(ScreenWithExtras(screen: Screen.walletPaymentStatus, argument: response));
    _razorpayInit!.dispose();
    retrieveWalletDetails();
  }
}
