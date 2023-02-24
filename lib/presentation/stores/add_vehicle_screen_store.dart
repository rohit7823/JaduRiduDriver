import 'package:jadu_ride_driver/core/common/alert_action.dart';
import 'package:jadu_ride_driver/core/common/alert_behaviour.dart';
import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/argument.dart';
import 'package:jadu_ride_driver/core/common/navigate_from.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/common/screen.dart';
import 'package:jadu_ride_driver/core/common/screen_wtih_extras.dart';
import 'package:jadu_ride_driver/core/domain/response/car_category.dart';
import 'package:jadu_ride_driver/core/domain/vehicle_category.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

import '../../core/repository/add_vehicle_repository.dart';

part 'add_vehicle_screen_store.g.dart';

class AddVehicleStore = _AddVehicleScreenStore with _$AddVehicleStore;

abstract class _AddVehicleScreenStore extends AppNavigator with Store {
  final _repository = dependency<AddVehicleRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool gettingDataLoader = false;

  @observable
  List<VehicleCategory> vCategories = [];

  @observable
  List<CarCategory> carCategories = [];

  @observable
  bool addingLoader = false;

  @observable
  bool addingcLoader = false;

  @observable
  VehicleCategory? selectedCategory;

  @observable
  CarCategory? selectcar;

  @observable
  String vehicleNumber = "";

  @observable
  bool enableBtn = false;

  _AddVehicleScreenStore() {
    _getInitialData();
    _validateInputs();
  }

  @action
  _validateInputs() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (vehicleNumber.isEmpty) {
        enableBtn = false;
      } else if (selectedCategory == null) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
    }
  }

  @action
  _getInitialData() async {
    gettingDataLoader = true;
    var response = await _repository.initialData();

    if (response is Success) {
      var data = response.data;
      gettingDataLoader = false;
      switch (data != null && data.status) {
        case true:
          vCategories = data!.categories;
          selectedCategory = data.categories.first;
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none,
                  action: AlertAction.addVehicleInitialData)));
      }
    } else if (response is Error) {
      gettingDataLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none,
              action: AlertAction.addVehicleInitialData)));
    }
  }

  @action
  addVehicle() async {
    addingLoader = true;
    var userId = _storage.userId();
    var response = await _repository.addVehicle(
        userId, selectcar?.id ?? "", selectedCategory?.id ?? "", vehicleNumber);
    if (response is Success) {
      var data = response.data;
      addingLoader = false;
      switch (data != null && data.status) {
        case true:
          if (data!.isAdded) {
            onChange(ScreenWithExtras(
                screen: Screen.addAllDetails,
                argument: Argument(navigateFrom: NavigateFrom.addVehicle)
            ));
          } else {
            dialogManager.initErrorData(AlertData(
                StringProvider.error,
                null,
                StringProvider.appId,
                data.message,
                StringProvider.retry,
                null,
                null,
                AlertBehaviour(
                    option: AlertOption.none, action: AlertAction.addVehicle)));
          }
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none, action: AlertAction.addVehicle)));
      }
    } else if (response is Error) {
      addingLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none, action: AlertAction.addVehicle)));
    }
  }

  @action
  addCar() async {
    addingcLoader = true;
    var userId = _storage.userId();
    var response = await _repository.addCar(selectedCategory?.id ?? "");
    if (response is Success) {
      var data = response.data;
      addingcLoader = false;
      switch (data != null && data.status) {
        case true:
          carCategories = data!.Car;
          selectcar = data.Car.first;
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.none,
                  action: AlertAction.subtypesalert)));
      }
    } else if (response is Error) {
      addingcLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.none, action: AlertAction.subtypesalert)));
    }
  }

  onError(AlertAction? action) {
    if (action == AlertAction.addVehicleInitialData) {
      _getInitialData();
    } else if (action == AlertAction.addVehicle) {
      addVehicle();
    }
  }

  @action
  onSelectCategory(VehicleCategory? category) {
    selectedCategory = category;
  }

  @action
  onSelectcarCategory(CarCategory? carcategory) {
    selectcar = carcategory;
  }

  @action
  onVehicleNumber(String number) {
    vehicleNumber = number;
  }
}
