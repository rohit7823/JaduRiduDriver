

import 'package:mobx/mobx.dart';
import '../../core/domain/location_schedule.dart';
import '../../core/helpers/storage.dart';
import '../../core/common/response.dart';
import '../../core/repository/schedule_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/my_utils.dart';

part 'schedule_view_model.g.dart';

class ScheduleStore = _ScheduleViewModel with _$ScheduleStore;

abstract class _ScheduleViewModel with Store{
  final _repository = dependency<ScheduleRepository>();
  final _prefs = dependency<Storage>();

  @observable
  List<LocationSchedule> scheduleArrayList = [];

  @observable
  bool isLoading = false;

  @observable
  bool isEmpty = false;

  @observable
  String msg = "";


  @action
  schedulelistItem() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.getScheduleResponse(userId);
    if (response is Success) {
      isLoading = false;
      var data = response.data;
      switch (data != null && data.status) {
        case true:
          if (data!.scheduleList.isEmpty) {

            //MyUtils.toastMessage("Empty List....");
            isEmpty = true;
            msg = data.message;
          } else {
            scheduleArrayList = data.scheduleList;
            isEmpty = false;
            msg = data.message;
            //MyUtils.toastMessage("Success....");
          }
      } //switch
    } else if (response is Error) {
      isLoading = false;
      MyUtils.toastMessage("Server Error found....");
    }
  }

}