// import 'dart:developer';
//
// import 'package:flutter/cupertino.dart';
// import 'package:jadu_ride_driver/core/common/alert_data.dart';
// import 'package:jadu_ride_driver/core/common/constants.dart';
// import 'package:jadu_ride_driver/core/domain/response/aboutwallet_response.dart';
// import 'package:jadu_ride_driver/core/helpers/razorpay_init.dart';
// import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
// import 'package:jadu_ride_driver/utills/message_informer.dart';
//
// import '../../core/common/current_date_time.dart';
// import '../../core/common/custom_radio_button.dart';
// import '../../core/common/response.dart';
// import '../../core/domain/current_balance_dates.dart';
// import '../../core/domain/package.dart';
// import '../../core/helpers/storage.dart';
// import 'package:mobx/mobx.dart';
// import '../../core/repository/current_balance_repository.dart';
// import '../../helpers_impls/date_time_helper.dart';
// import '../../modules/app_module.dart';
// import '../../utills/dialog_manager.dart';
// import '../../utills/my_utils.dart';
//
// part 'current_balance_view_model.g.dart';
//
// class CurrentBalanceStore = _CurrentBalanceViewModel with _$CurrentBalanceStore;
//
// abstract class _CurrentBalanceViewModel with Store {
//   static const _walletOption = Constants.walletOption;
//   final _repository = dependency<CurrentBalanceRepository>();
//   final _prefs = dependency<Storage>();
//   final msgInformer = MessageInformer();
//   final dialogManager = DialogManager();
//   final _dateTimeHelper = DateTimeHelper();
//   RazorpayInit? _razorpayInit;
//
//
//
//   final walletOption = _walletOption;
//
//   @observable
//   Package? selectd;
//
//
//   @observable
//   List<Package> allDatesLists = [];
//
//   @observable
//   Package? selectedDates;
//
//   @observable
//   List<CurrentBalanceDates> currentBalanceList = [];
//
//   @observable
//   bool isLoading = false;
//
//   @observable
//   bool datesSelectedListLoader = false;
//
//   @observable
//   String finalCurrentDate = "";
//
//   @action
//   currentDate() {
//     finalCurrentDate = GetDateState.getCurrentDate();
//   }
//
//   openDatePicker() {
//     dialogManager.openDatePicker();
//   }
//
//   @observable
//   DriverTransactionType selected = DriverTransactionType.none;
//
//
//   @observable
//   bool openingPaymentGatewayLoader = false;
//
//   @observable
//   bool gettingWalletDetailsLoader = false;
//
//
//   @observable
//   WalletDetails? details;
//
//
//
//   _CurrentBalanceViewModel() {
//     retrieveWalletDetails();
//   }
//
//
//
//   @action
//   onRadioSelected(DriverTransactionType? selectedValue) {
//     if (selectedValue == null) {
//       selected = DriverTransactionType.none;
//       allDatelistItem();
//     } else {
//       selected = selectedValue;
//       allDatelistItem();
//     }
//   }
//
//   @action
//   onSelectDate(DateTime? selected) {
//     if (selected != null) {
//       //finalCurrentDate = "${selected.day} ${_dateTimeHelper.getMonthName(selected.month)}, ${selected.year}";
//       finalCurrentDate = "${selected.day}-${selected.month}-${selected.year}";
//       allDatelistItem();
//     } else {
//       currentDate();
//     }
//   }
//
//   @action
//   onState(Package? dates) {
//     selectedDates = dates;
//     datelistItem(selectedDates!.id);
//   }
//
//   //drop down...........................
//   @action
//   allDatelistItem() async {
//     isLoading = true;
//     var userId = _prefs.userId();
//     var response = await _repository.allDatesResponse(userId);
//     if (response is Success) {
//       var data = response.data;
//       isLoading = false;
//       switch (data != null && data.status) {
//         case true:
//           if (data!.allDatesList.isEmpty) {
//             MyUtils.toastMessage("Empty....");
//           } else {
//             allDatesLists = data.allDatesList;
//             selectedDates = data.allDatesList.first;
//             datelistItem(selectedDates!.id);
//             //MyUtils.toastMessage("Success....");
//           }
//       } //switch
//     } else if (response is Error) {
//       MyUtils.toastMessage("Error found....");
//       isLoading = false;
//     }
//   }
//
//
//
//
//
//   //selected item list..............
//   @action
//   datelistItem(String id) async {
//     datesSelectedListLoader = true;
//     var userId = _prefs.userId();
//     var response = await _repository.uploadCurrentBalanceResponse(userId, id);
//     if (response is Success) {
//       var data = response.data;
//       datesSelectedListLoader = false;
//       switch (data != null && data.status) {
//         case true:
//           if (data!.currentBalanceDates.isEmpty) {
//             //MyUtils.toastMessage("Empty....");
//
//           } else {
//             currentBalanceList = data.currentBalanceDates;
//             //MyUtils.toastMessage("Success....");
//           }
//       } //switch
//     } else if (response is Error) {
//       MyUtils.toastMessage("Error found....");
//       datesSelectedListLoader = false;
//     }
//   }
//
//
//
//   onSelectAmount(Package? selected) async {
//     msgInformer.informUi(StringProvider.paymentGatewayOpening);
//     var response = await _repository.fetchRazorpayData(_prefs.userId(), selected?.id ?? "");
//     if (response is Success) {
//       var data = response.data;
//       switch (data != null && data.status) {
//         case true:
//           _razorpayInit = RazorpayInit(
//             options: data!.data,
//             successNotify: (PaymentSuccessResponse ) {
//
//             },
//             errorNotify: (PaymentFailureResponse ) {  },
//             walletNotify: (ExternalWalletResponse ) {  },
//
//           );
//           break;
//         default:
//
//       }
//     } else if (response is Error) {
//
//     }
//   }
//
//   @action
//   retrieveWalletDetails() async {
//     gettingWalletDetailsLoader = true;
//     var response = await _repository.walletDetails(_prefs.userId());
//     if (response is Success) {
//       var data = response.data;
//       gettingWalletDetailsLoader = false;
//       switch (data != null && data.status) {
//         case true:
//           details = data!.details;
//           break;
//         default:
//           msgInformer.informUi(data?.message ?? "");
//       }
//     } else if (response is Error) {
//       msgInformer.informUi(response.message ?? "");
//     }
//   }
//
//   @action
//   onClickRefillWallet() async {
//     openingPaymentGatewayLoader = true;
//     var response = await _repository.walletRechargeAmounts(_prefs.userId());
//     log("recharAmount $response");
//     if (response is Success) {
//       var data = response.data;
//       openingPaymentGatewayLoader = false;
//       switch (data != null && data.status) {
//         case true:
//
//           dialogManager.initData(AlertData(
//               StringProvider.rechargeYourWallet,
//               null,
//               StringProvider.appId,
//               StringProvider.selectAnyAmountForRecharge,
//               StringProvider.done,
//               null,
//               null,
//               data?.packages
//           ));
//           break;
//         default:
//           msgInformer.informUi(StringProvider.unableToOpenPaymentGateway);
//       }
//     } else if (response is Error) {
//       openingPaymentGatewayLoader = false;
//       msgInformer.informUi(StringProvider.someNetworkIssueisHappening);
//     }
//   }
// }
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/constants.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/response/aboutwallet_response.dart';
import 'package:jadu_ride_driver/core/helpers/razorpay_init.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/message_informer.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../core/common/current_date_time.dart';
import '../../core/common/custom_radio_button.dart';
import '../../core/common/response.dart';
import '../../core/domain/current_balance_dates.dart';
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
  Package? selectd;


  @observable
  List<Package> allDatesLists = [];

  @observable
  Package? selectedDates;

  @observable
  List<CurrentBalanceDates> currentBalanceList = [];

  @observable
  bool isLoading = false;

  @observable
  bool datesSelectedListLoader = false;

  @observable
  String finalCurrentDate = "";

  @action
  currentDate() {
    finalCurrentDate = GetDateState.getCurrentDate();
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
    if (selectedValue == null) {
      selected = DriverTransactionType.none;
      allDatelistItem();
    } else {
      selected = selectedValue;
      allDatelistItem();
    }
  }

  @action
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      //finalCurrentDate = "${selected.day} ${_dateTimeHelper.getMonthName(selected.month)}, ${selected.year}";
      finalCurrentDate = "${selected.day}-${selected.month}-${selected.year}";
      allDatelistItem();
    } else {
      currentDate();
    }
  }

  @action
  onState(Package? dates) {
    selectedDates = dates;
    datelistItem(selectedDates!.id);
  }

  //drop down...........................
  @action
  allDatelistItem() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.allDatesResponse(userId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.allDatesList.isEmpty) {
            MyUtils.toastMessage("Empty....");
          } else {
            allDatesLists = data.allDatesList;
            selectedDates = data.allDatesList.first;
            datelistItem(selectedDates!.id);
            //MyUtils.toastMessage("Success....");
          }
      } //switch
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }





  //selected item list..............
  @action
  datelistItem(String id) async {
    datesSelectedListLoader = true;
    var userId = _prefs.userId();
    var response = await _repository.uploadCurrentBalanceResponse(userId, id);
    if (response is Success) {
      var data = response.data;
      datesSelectedListLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.currentBalanceDates.isEmpty) {
            //MyUtils.toastMessage("Empty....");

          } else {
            currentBalanceList = data.currentBalanceDates;
            //MyUtils.toastMessage("Success....");
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

          amount = data!.amount;
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