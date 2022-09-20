import 'dart:html';
import '../../core/common/response.dart';
import '../../core/domain/current_balance_dates.dart';
import '../../core/helpers/storage.dart';
import 'package:mobx/mobx.dart';
import '../../core/repository/current_balance_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/my_utils.dart';

part 'current_balance_view_model.g.dart';

class CurrentBalanceStore = _CurrentBalanceViewModel with _$CurrentBalanceStore;

abstract class _CurrentBalanceViewModel with Store {
  final _repository = dependency<CurrentBalanceRepository>();
  final _prefs = dependency<Storage>();

  @observable
  List<CurrentBalanceDates> currentBalanceList = [];

  @observable
  bool isLoading = false;

  @action
  datelistItem() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.uploadCurrentBalanceResponse(userId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
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
      isLoading = false;
    }
  }

}