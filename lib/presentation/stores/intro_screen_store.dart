import 'package:jadu_ride_driver/core/domain/intro_data.dart';
import 'package:mobx/mobx.dart';

part 'intro_screen_store.g.dart';

class IntroStore = _IntroScreenStore with _$IntroStore;

abstract class _IntroScreenStore with Store {
  List<IntroData> data;
  _IntroScreenStore({required this.data});

  @observable
  int currentPage = 0;

  @action
  onChange(int page) {
    currentPage = page;
  }

  @action
  onNext() {}
}
