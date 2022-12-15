import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import '../../core/common/current_date_time.dart';
import '../../core/common/payment_summery_radio_button.dart';
import '../../core/common/response.dart';
import '../../core/domain/trips_details.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/trips_details_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../../utills/my_utils.dart';

part 'trips_details_view_model.g.dart';

class TripsDetailsStore = _TripsViewModel with _$TripsDetailsStore;

abstract class _TripsViewModel with Store{
  final _repository = dependency<TripsDetailsRepository>();
  final _prefs = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool isLoading = false;

  @observable
  DriverTransactionPaymentSummeryType selected = DriverTransactionPaymentSummeryType.none;



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
  List<Trip> tripDetailsArrayList = [];


  List<Trip> tripDetailsArrayListbackup = [];


  _TripsViewModel(){
    _initialData();
  }


  @action
  onSelectDate(DateTime? selected) {
    if (selected != null) {
      //finalCurrentDate = "${selected.day} ${_dateTimeHelper.getMonthName(selected.month)}, ${selected.year}";
      finalCurrentDate = "${selected.year}-${selected.month}-${selected.day}";
      //MyUtils.toastMessage(finalCurrentDate);
      _initialData();
    } else {
      currentDate();
    }
  }






  @action
  onRadioSelected(DriverTransactionPaymentSummeryType? selectedValue) {
    if (selectedValue != null) {
      selected = selectedValue;
      var temp = <Trip>[];
      for (var element in tripDetailsArrayListbackup) {
        debugPrint('${selectedValue.name} ${element.paymentType}');
        if(selectedValue.name == element.paymentType) {
          temp.add(element);
        }
      }
      tripDetailsArrayList= temp;
    }
  }



  @action
  _initialData() async {
    datesSelectedListLoader = true;
    var userId = _prefs.userId();
    var response = await _repository.getTripsDetailsInittialData(userId, finalCurrentDate);
    //debugPrint(response.toString());
    if (response is Success) {
      var data = response.data;
      datesSelectedListLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.trips.isEmpty) {
            tripDetailsArrayList = [];
            tripDetailsArrayListbackup = [];
            MyUtils.toastMessage("Empty List....");
          } else {
            tripDetailsArrayList = data.trips;
            tripDetailsArrayListbackup = data.trips;
            //MyUtils.toastMessage("Success....");
          }
      } //switch
    } else if (response is Error) {
      MyUtils.toastMessage("Server Error found....");
      datesSelectedListLoader = false;
    }
  }

}