

import 'package:mobx/mobx.dart';

import '../../core/common/alert_action.dart';
import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/alert_option.dart';
import '../../core/common/response.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/refund_policy_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../ui/string_provider.dart';

part 'refund_policy_view_model.g.dart';

class RefundPolicyStore = _RefundPolicy with _$RefundPolicyStore;

abstract class _RefundPolicy with Store{
  final _repository = dependency<RefundPolicyRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool isLoader = false;

  @observable
  String refundPolicyTxt = "";

  @observable
  String msg = "";


  _RefundPolicy(){
    _initialData();
  }
  @action
  _initialData() async {
    isLoader = true;
    var userId = _storage.userId();
    var response = await _repository.getRefundPolicyInittialData(userId);
    //debugPrint(response.toString());
    if(response is Success){
      var data = response.data;
      isLoader = false;
      switch (data != null && data.status) {
        case true:
          msg = data!.message;
          refundPolicyTxt = data.refundPolicyTxt;

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