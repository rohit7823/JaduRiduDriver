
import 'package:jadu_ride_driver/core/domain/payment_summery.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/current_date_time.dart';
import '../../core/common/payment_summery_radio_button.dart';
import '../../core/common/response.dart';
import '../../core/domain/package.dart';
import '../../core/repository/payment_summery_repository.dart';
import '../../helpers_impls/date_time_helper.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../../core/helpers/storage.dart';
import '../../utills/my_utils.dart';

part 'payment_summery_view_model.g.dart';

class PaymentSummaryStores =_PaymentSummeryViewModel with _$PaymentSummaryStores;

abstract class _PaymentSummeryViewModel with Store{
  final _repository = dependency<PaymentSummeryRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();
  //final _dateTimeHelper = DateTimeHelper();

  @observable
  List<PaymentSummery> pamentSummeryArrayList = [];

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
  DriverTransactionPaymentSummeryType selected = DriverTransactionPaymentSummeryType.none;

  @action
  onRadioSelected(DriverTransactionPaymentSummeryType? selectedValue) {
    if (selectedValue == null) {
      selected = DriverTransactionPaymentSummeryType.none;
      datelistItem();
      MyUtils.toastMessage("hahaa....");
    } else {
      selected = selectedValue;
      if(selected.name=="cash"){
        datelistItem();
        //MyUtils.toastMessage("cash");
      }else{
        //MyUtils.toastMessage("online");
        datelistItem();
      }
    }
  }

  @action
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      //finalCurrentDate = "${selected.day} ${_dateTimeHelper.getMonthName(selected.month)}, ${selected.year}";
      finalCurrentDate = "${selected.day}-${selected.month}-${selected.year}";
      datelistItem();
    } else {
      currentDate();
    }
  }

  //selected item list..............
  @action
  datelistItem() async {
    datesSelectedListLoader = true;
    var userId = _prefs.userId();
    var response = await _repository.getPaymentSummeryResponse();
    if (response is Success) {
      var data = response.data;
      datesSelectedListLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.paymentSummeryList.isEmpty) {
            MyUtils.toastMessage("Empty List....");
          } else {
            pamentSummeryArrayList = data.paymentSummeryList;
            //MyUtils.toastMessage("Success....");
          }
      } //switch
    } else if (response is Error) {
      MyUtils.toastMessage("Server Error found....");
      datesSelectedListLoader = false;
    }
  }
}