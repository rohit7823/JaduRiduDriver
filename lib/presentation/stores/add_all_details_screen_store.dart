import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:mobx/mobx.dart';

part 'add_all_details_screen_store.g.dart';

class AddAllDetailsStore = _AddAllDetailsScreenStore with _$AddAllDetailsStore;

abstract class _AddAllDetailsScreenStore extends AppNavigator with Store {
  final _storage = dependency<Storage>();

  String get userName => _storage.name();
}
