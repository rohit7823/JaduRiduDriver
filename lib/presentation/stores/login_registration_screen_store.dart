import 'package:jadu_ride_driver/core/common/navigation_option.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:mobx/mobx.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';

part 'login_registration_screen_store.g.dart';

class LRStore = _LoginRegistrationScreenStore with _$LRStore;

abstract class _LoginRegistrationScreenStore extends AppNavigator with Store {
  final _storage = dependency<Storage>();

  loginClicked() {
    onChange(ScreenWithExtras(
        screen: Screen.numberInputScreen,
        option: NavigationOption(option: Option.popPrevious)));
  }

  registerClicked() {
    onChange(ScreenWithExtras(
        screen: Screen.numberInputScreen,
        option: NavigationOption(option: Option.popPrevious)));
  }
}
