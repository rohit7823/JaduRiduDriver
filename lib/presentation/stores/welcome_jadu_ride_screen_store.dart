import 'dart:ffi';

import 'package:jadu_ride_driver/core/common/alert_data.dart';
import 'package:jadu_ride_driver/core/common/alert_option.dart';
import 'package:jadu_ride_driver/core/common/response.dart';
import 'package:jadu_ride_driver/core/domain/mobile_number_code.dart';
import 'package:jadu_ride_driver/core/domain/package.dart';
import 'package:jadu_ride_driver/core/helpers/storage.dart';
import 'package:jadu_ride_driver/core/repository/welcome_jadu_ride_repository.dart';
import 'package:jadu_ride_driver/modules/app_module.dart';
import 'package:jadu_ride_driver/presentation/stores/navigator.dart';
import 'package:jadu_ride_driver/presentation/ui/string_provider.dart';
import 'package:jadu_ride_driver/utills/dialog_manager.dart';
import 'package:mobx/mobx.dart';

part 'welcome_jadu_ride_screen_store.g.dart';

class WelcomeJaduRideStore = _WelcomeJaduRideScreenStore with _$WelcomeJaduRideStore;

abstract class _WelcomeJaduRideScreenStore extends AppNavigator with Store {

  final _repository = dependency<WelcomeJaduRideRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();

  @observable
  bool gettingLoader = false;

  @observable
  String userMobileNumber = "";

  @observable
  List<Package> states = [];

  @observable
  List<Package> districts = [];

  @observable
  List<Package> cities = [];

  @observable
  List<MobileNumberCode> codes = [];

  @observable
  MobileNumberCode? selectedCode;

  @observable
  Package? selectedDistrict;

  @observable
  Package? selectedState;

  @observable
  Package? selectedCity;

  @observable
  bool gettingDistrictsLoader = false;

  @observable
  bool gettingCitiesLoader = false;

  @observable
  String userName = "";

  @observable
  String userEmail = "";

  @observable
  String referralCode = "";

  @observable
  bool isTermsSelected = false;

  @observable
  bool enableBtn = false;

  _WelcomeJaduRideScreenStore() {
    _initialData();
    _validateInputs();
  }

  @action
  _initialData() async {
    gettingLoader = true;
    var userId = _storage.userId();
    var response = await _repository.getInitialData(userId);
    if(response is Success) {
      var data = response.data;
      gettingLoader = false;
      switch(data != null && data.status){
        case true:
          userMobileNumber = data!.mobileNumber;
          states = data.states;
          codes = data.numberCodes;
          selectedCode = data.numberCodes.first;
          selectedState = data.states.first;
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null, AlertOption.none)
          );
      }
    } else if(response is Error) {
      gettingLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null, AlertOption.none)
      );
    }
  }

  @action
  getDistricts() async {
    gettingDistrictsLoader = true;
    var response = await _repository.districts(selectedState!.id);
    if(response is Success) {
      var data = response.data;
      gettingDistrictsLoader = false;
      switch(data != null && data.status) {
        case true:
          districts = data!.districts;
          selectedDistrict = data.districts.first;
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null, AlertOption.none)
          );
      }
    } else if(response is Error) {
      gettingDistrictsLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null, AlertOption.none)
      );
    }
  }

  @action
  getCities() async {
    gettingCitiesLoader = true;
    var response = await _repository.cities(selectedDistrict!.id);
    if(response is Success) {
      var data = response.data;
      gettingCitiesLoader = false;
      switch(data != null && data.status) {
        case true:
          cities = data!.cities;
          selectedCity = data.cities.first;
          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null, AlertOption.none)
          );
      }
    } else if(response is Error) {
      gettingCitiesLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null, AlertOption.none)
      );
    }
  }


  @action
  name(String value) {
    userName = value;
  }

  @action
  email(String value) {
    userEmail = value;
  }

  @action
  mobileNumber(String number) {
    userMobileNumber = number;
  }

  @action
  mobileNumberCleared() {
    userMobileNumber = "";
  }

  @action
  onNumberCode(MobileNumberCode? code) {
    selectedCode = code;
  }

  @action
  onReferralCode(String code) {
    referralCode = code;
  }

  @action
  termsConditionClicked() {
    isTermsSelected = !isTermsSelected;
  }

  @action
  onState(Package? state) {
    selectedState = state;
  }

  @action
  onDistrict(Package? district) {
    selectedDistrict = district;
  }

  @action
  onCity(Package? city) {
    selectedCity = city;
  }

  @action
  _validateInputs() async {
    while(true) {
      await Future.delayed(const Duration(milliseconds: 300));
      if(userName.isEmpty) {
        enableBtn = false;
      } else if(referralCode.isEmpty) {
        enableBtn = false;
      } else if(userMobileNumber.isEmpty) {
        enableBtn = false;
      } else if(!isTermsSelected) {
        enableBtn = false;
      } else {
        enableBtn = true;
      }
    }
  }

  @action
  onContinue() async {

  }
}