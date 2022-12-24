import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:mobx/mobx.dart';

part 'navigator.g.dart';

class AppNavigator = _Navigator with _$AppNavigator;

abstract class _Navigator with Store {
  @observable
  ScreenWithExtras? _change;

  @computed
  ScreenWithExtras? get currentChange => _change;

  Screen visibleScreen = Screen.none;

  @action
  onChange(ScreenWithExtras data) {
    _change = data;
    visibleScreen = data.screen;
  }

  @action
  clear() {
    _change = null;
  }
}
