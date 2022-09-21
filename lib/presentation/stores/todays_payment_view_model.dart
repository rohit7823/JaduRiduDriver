

import 'package:jadu_ride_driver/core/domain/todays_list_response.dart';
import 'package:mobx/mobx.dart';
import '../../core/common/response.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/todays_payment_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/my_utils.dart';

part 'todays_payment_view_model.g.dart';

class TodaysPaymentss = _TodaysPaymentViewModel with _$TodaysPaymentss;

abstract class _TodaysPaymentViewModel with Store{

  final _repository = dependency<TodaysPaymentRepository>();
  final _prefs = dependency<Storage>();

  @observable
  List<TodaysPayment> todaysPaymentList = [];

  @observable
  bool isLoading = false;

  @action
  todaysPaymentListItem() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.getTodaysPaymentResponse(userId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.todaysPayment.isEmpty) {
            //MyUtils.toastMessage("Empty....");

          } else {
            todaysPaymentList = data.todaysPayment;
            //MyUtils.toastMessage("Success....");
          }
      } //switch
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }

}