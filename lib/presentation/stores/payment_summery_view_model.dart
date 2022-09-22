
import 'package:jadu_ride_driver/core/domain/payment_summery.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/current_date_time.dart';
import '../../core/common/custom_radio_button.dart';
import '../../core/repository/payment_summery_repository.dart';
import '../../helpers_impls/date_time_helper.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../../core/helpers/storage.dart';

part 'payment_summery_view_model.g.dart';

class PaymentSummaryStores =_PaymentSummeryViewModel with _$PaymentSummaryStores;

abstract class _PaymentSummeryViewModel with Store{
  final _repository = dependency<PaymentSummeryRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();
  final _dateTimeHelper = DateTimeHelper();

  @observable
  List<PaymentSummery> pamentSummeryList = [];

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

  @action
  onRadioSelected(DriverTransactionType? selectedValue) {
    if (selectedValue == null) {
      selected = DriverTransactionType.none;
      //allDatelistItem();
    } else {
      selected = selectedValue;
      //allDatelistItem();
    }
  }

  @action
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      //finalCurrentDate = "${selected.day} ${_dateTimeHelper.getMonthName(selected.month)}, ${selected.year}";
      finalCurrentDate = "${selected.day}-${selected.month}-${selected.year}";
      //allDatelistItem();
    } else {
      currentDate();
    }
  }

}