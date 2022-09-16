import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:mobx/mobx.dart';
import '../../core/domain/incentive.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/incentive_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/api_client_configuration.dart';
import '../../utills/my_utils.dart';

part 'incentive_view_model.g.dart';

class IncentivesStore = _IncentivesViewModel with _$IncentivesStore;

abstract class _IncentivesViewModel with Store {
  final _repository = dependency<IncentiveRepository>();
  final _prefs = dependency<Storage>();

  @observable
  List<Incentive> incentiveList = [];

  @observable
  bool isLoading = false;

  @action
  listItem() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.uploadIncentiveResponse(userId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.incentives.isEmpty) {
            MyUtils.toastMessage("Empty....");

          } else {
            incentiveList = data.incentives;
            MyUtils.toastMessage("Success....");
          }
      } //switch
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }
}
