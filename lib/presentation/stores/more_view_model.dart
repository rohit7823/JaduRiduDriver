
import 'package:jadu_ride_driver/core/common/profile_short_description.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:mobx/mobx.dart';
import '../../core/common/response.dart';
import '../../core/common/screen_wtih_extras.dart';
import '../../core/helpers/storage.dart';
import '../../core/repository/profile_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/my_utils.dart';

part 'more_view_model.g.dart';

class MoreViewModels = _Profile with _$MoreViewModels;

abstract class _Profile extends AppNavigator with Store{
  final _repository = dependency<ProfileRepository>();
  final _prefs = dependency<Storage>();



  @observable
  bool isLoading = false;

  @observable
  String driverName = "";

  @observable
  String imageURL = "";



  @action
  getShortProfileData() async {
    isLoading = true;
    var userId = _prefs.userId();
    var response = await _repository.profileRequest(userId);
    //debugPrint("MyData"+response.data.toString());
    if (response is Success) {
      var data = response.data;
      isLoading = false;
      switch (data != null && data.status) {
        case true:
          driverName = data!.driverShortProfile.driverName;
          imageURL = data.driverShortProfile.profileImagePath;

          break;
      }
    } else if (response is Error) {
      MyUtils.toastMessage("Error found....");
      isLoading = false;
    }
  }

  //current balance click.......
  onProfileDetails() {
    onChange(ScreenWithExtras(
        screen: Screen.profileDetailsScreen, argument: ProfileShortDescription(driverName: driverName, driverImageURL: imageURL), ));
  }

  //current balance click.......
  onRefer() {
    onChange(ScreenWithExtras(
      screen: Screen.referScreen, ));
  }

}