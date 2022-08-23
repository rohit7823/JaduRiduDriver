
import 'package:get_it/get_it.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';

final cDependency = GetIt.instance;

Future<void> initComponentModule() async {

  cDependency.registerLazySingleton<DialogManager>(() => DialogManager());



}