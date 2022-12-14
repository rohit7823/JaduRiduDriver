import 'package:mobx/mobx.dart';
import '../../core/common/response.dart';
import '../../core/domain/amount_transferred_by_day_response.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/amount_transffered_by_day_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/my_utils.dart';

part 'amount_transffered_by_day.g.dart';

class AmountTransfferedByDayStore = _AmountTransfferedByDays with _$AmountTransfferedByDayStore;

abstract class _AmountTransfferedByDays with Store{

  final _repository = dependency<AmountTransfferedByDayRepository>();
  final _prefs = dependency<Storage>();

  @observable
  List<AmountTransferredByDayResponseClass> amountTransferredList = [];

  @observable
  bool isLoading = false;

  @observable
  bool isEmpty = false;

  @observable
  String msg = "";

  @action
  amountTransferredListItem() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.getAmountTransferredResponse(userId);
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          if (data!.Transferredamount.isEmpty) {
            isEmpty = true;
            msg = data.message;
          } else {
            isEmpty = false;
            msg = data.message;
            amountTransferredList = data.Transferredamount;
          }
      } //switch
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }

}