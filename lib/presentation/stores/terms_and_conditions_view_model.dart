

import 'package:mobx/mobx.dart';
import '../../core/common/alert_action.dart';
import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/alert_option.dart';
import '../../core/common/response.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/terms_and_conditions_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../ui/string_provider.dart';

part 'terms_and_conditions_view_model.g.dart';

class TermsAndConditionsStore = _TermsAndConditionsViewModel with _$TermsAndConditionsStore;

abstract class _TermsAndConditionsViewModel with Store{
  final _repository = dependency<TermsAndConditionsRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool isLoader = false;

  @observable
  String conditionsTxt = "";

  @observable
  String msg = "";


  _TermsAndConditionsViewModel(){
    _initialData();
  }
  @action
  _initialData() async {
    isLoader = true;
    var userId = _storage.userId();
    var response = await _repository.getTermsAndConditionsInittialData(userId);
    //debugPrint(response.toString());
    if(response is Success){
      var data = response.data;
      isLoader = false;
      switch (data != null && data.status) {
        case true:
          msg = data!.message;
          conditionsTxt = data.termsConditionsTxt;

          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.invokeOnBarrier,
                  action: AlertAction.welcomeJaduRideInitialData)));
      }
    }else if (response is Error) {
      isLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.invokeOnBarrier,
              action: AlertAction.welcomeJaduRideInitialData)));
    }
  }
}