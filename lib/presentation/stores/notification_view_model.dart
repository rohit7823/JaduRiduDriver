import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/response/about_notification_response.dart';
import 'package:jadu_ride_driver/core/domain/response/getNotifiicationResponse.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/notification_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:mobx/mobx.dart';


part 'notification_view_model.g.dart';

class NotificationStore = _NotificationViewModels with _$NotificationStore;



abstract class _NotificationViewModels  with Store{
  final _repository = dependency<NotificationRepository>();
  final _prefs = dependency<Storage>();

  @observable
  List<NotificationResponseClass> NList = [];

  @observable
  bool isLoading = false;

  @observable
  bool isEmpty = false;


  @observable
  String msg = "";

  @action
  getNotificationData() async{
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.getNotificationSummery( userId);
    if(response is Success){
      var data = response.data;
      isLoading = false;
      switch(data != null && data.status){
        case true:
          if (data!.notificationlist.isEmpty) {
            isEmpty = true;
            msg = data.message;

          } else {
            isEmpty = false;
            msg = data.message;
            NList = data.notificationlist;
          }
      }
    }
  }

}
