// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_jadu_ride_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WelcomeJaduRideStore on _WelcomeJaduRideScreenStore, Store {
  late final _$gettingLoaderAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.gettingLoader', context: context);

  @override
  bool get gettingLoader {
    _$gettingLoaderAtom.reportRead();
    return super.gettingLoader;
  }

  @override
  set gettingLoader(bool value) {
    _$gettingLoaderAtom.reportWrite(value, super.gettingLoader, () {
      super.gettingLoader = value;
    });
  }

  late final _$userMobileNumberAtom = Atom(
      name: '_WelcomeJaduRideScreenStore.userMobileNumber', context: context);

  @override
  String get userMobileNumber {
    _$userMobileNumberAtom.reportRead();
    return super.userMobileNumber;
  }

  @override
  set userMobileNumber(String value) {
    _$userMobileNumberAtom.reportWrite(value, super.userMobileNumber, () {
      super.userMobileNumber = value;
    });
  }

  late final _$statesAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.states', context: context);

  @override
  List<Package> get states {
    _$statesAtom.reportRead();
    return super.states;
  }

  @override
  set states(List<Package> value) {
    _$statesAtom.reportWrite(value, super.states, () {
      super.states = value;
    });
  }

  late final _$districtsAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.districts', context: context);

  @override
  List<Package> get districts {
    _$districtsAtom.reportRead();
    return super.districts;
  }

  @override
  set districts(List<Package> value) {
    _$districtsAtom.reportWrite(value, super.districts, () {
      super.districts = value;
    });
  }

  late final _$citiesAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.cities', context: context);

  @override
  List<Package> get cities {
    _$citiesAtom.reportRead();
    return super.cities;
  }

  @override
  set cities(List<Package> value) {
    _$citiesAtom.reportWrite(value, super.cities, () {
      super.cities = value;
    });
  }

  late final _$codesAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.codes', context: context);

  @override
  List<MobileNumberCode> get codes {
    _$codesAtom.reportRead();
    return super.codes;
  }

  @override
  set codes(List<MobileNumberCode> value) {
    _$codesAtom.reportWrite(value, super.codes, () {
      super.codes = value;
    });
  }

  late final _$selectedCodeAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.selectedCode', context: context);

  @override
  MobileNumberCode? get selectedCode {
    _$selectedCodeAtom.reportRead();
    return super.selectedCode;
  }

  @override
  set selectedCode(MobileNumberCode? value) {
    _$selectedCodeAtom.reportWrite(value, super.selectedCode, () {
      super.selectedCode = value;
    });
  }

  late final _$selectedDistrictAtom = Atom(
      name: '_WelcomeJaduRideScreenStore.selectedDistrict', context: context);

  @override
  Package? get selectedDistrict {
    _$selectedDistrictAtom.reportRead();
    return super.selectedDistrict;
  }

  @override
  set selectedDistrict(Package? value) {
    _$selectedDistrictAtom.reportWrite(value, super.selectedDistrict, () {
      super.selectedDistrict = value;
    });
  }

  late final _$selectedStateAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.selectedState', context: context);

  @override
  Package? get selectedState {
    _$selectedStateAtom.reportRead();
    return super.selectedState;
  }

  @override
  set selectedState(Package? value) {
    _$selectedStateAtom.reportWrite(value, super.selectedState, () {
      super.selectedState = value;
    });
  }

  late final _$selectedCityAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.selectedCity', context: context);

  @override
  Package? get selectedCity {
    _$selectedCityAtom.reportRead();
    return super.selectedCity;
  }

  @override
  set selectedCity(Package? value) {
    _$selectedCityAtom.reportWrite(value, super.selectedCity, () {
      super.selectedCity = value;
    });
  }

  late final _$gettingDistrictsLoaderAtom = Atom(
      name: '_WelcomeJaduRideScreenStore.gettingDistrictsLoader',
      context: context);

  @override
  bool get gettingDistrictsLoader {
    _$gettingDistrictsLoaderAtom.reportRead();
    return super.gettingDistrictsLoader;
  }

  @override
  set gettingDistrictsLoader(bool value) {
    _$gettingDistrictsLoaderAtom
        .reportWrite(value, super.gettingDistrictsLoader, () {
      super.gettingDistrictsLoader = value;
    });
  }

  late final _$gettingCitiesLoaderAtom = Atom(
      name: '_WelcomeJaduRideScreenStore.gettingCitiesLoader',
      context: context);

  @override
  bool get gettingCitiesLoader {
    _$gettingCitiesLoaderAtom.reportRead();
    return super.gettingCitiesLoader;
  }

  @override
  set gettingCitiesLoader(bool value) {
    _$gettingCitiesLoaderAtom.reportWrite(value, super.gettingCitiesLoader, () {
      super.gettingCitiesLoader = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$referralCodeAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.referralCode', context: context);

  @override
  String get referralCode {
    _$referralCodeAtom.reportRead();
    return super.referralCode;
  }

  @override
  set referralCode(String value) {
    _$referralCodeAtom.reportWrite(value, super.referralCode, () {
      super.referralCode = value;
    });
  }

  late final _$isTermsSelectedAtom = Atom(
      name: '_WelcomeJaduRideScreenStore.isTermsSelected', context: context);

  @override
  bool get isTermsSelected {
    _$isTermsSelectedAtom.reportRead();
    return super.isTermsSelected;
  }

  @override
  set isTermsSelected(bool value) {
    _$isTermsSelectedAtom.reportWrite(value, super.isTermsSelected, () {
      super.isTermsSelected = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_WelcomeJaduRideScreenStore.enableBtn', context: context);

  @override
  bool get enableBtn {
    _$enableBtnAtom.reportRead();
    return super.enableBtn;
  }

  @override
  set enableBtn(bool value) {
    _$enableBtnAtom.reportWrite(value, super.enableBtn, () {
      super.enableBtn = value;
    });
  }

  late final _$uploadingLoaderAtom = Atom(
      name: '_WelcomeJaduRideScreenStore.uploadingLoader', context: context);

  @override
  bool get uploadingLoader {
    _$uploadingLoaderAtom.reportRead();
    return super.uploadingLoader;
  }

  @override
  set uploadingLoader(bool value) {
    _$uploadingLoaderAtom.reportWrite(value, super.uploadingLoader, () {
      super.uploadingLoader = value;
    });
  }

  late final _$emailValidatorAtom = Atom(
      name: '_WelcomeJaduRideScreenStore.emailValidator', context: context);

  @override
  bool get emailValidator {
    _$emailValidatorAtom.reportRead();
    return super.emailValidator;
  }

  @override
  set emailValidator(bool value) {
    _$emailValidatorAtom.reportWrite(value, super.emailValidator, () {
      super.emailValidator = value;
    });
  }

  late final _$_initialDataAsyncAction =
      AsyncAction('_WelcomeJaduRideScreenStore._initialData', context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  late final _$getDistrictsAsyncAction =
      AsyncAction('_WelcomeJaduRideScreenStore.getDistricts', context: context);

  @override
  Future getDistricts() {
    return _$getDistrictsAsyncAction.run(() => super.getDistricts());
  }

  late final _$getCitiesAsyncAction =
      AsyncAction('_WelcomeJaduRideScreenStore.getCities', context: context);

  @override
  Future getCities() {
    return _$getCitiesAsyncAction.run(() => super.getCities());
  }

  late final _$_validateInputsAsyncAction = AsyncAction(
      '_WelcomeJaduRideScreenStore._validateInputs',
      context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$onContinueAsyncAction =
      AsyncAction('_WelcomeJaduRideScreenStore.onContinue', context: context);

  @override
  Future onContinue() {
    return _$onContinueAsyncAction.run(() => super.onContinue());
  }

  late final _$_WelcomeJaduRideScreenStoreActionController =
      ActionController(name: '_WelcomeJaduRideScreenStore', context: context);

  @override
  dynamic name(String value) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.name');
    try {
      return super.name(value);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic email(String value) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.email');
    try {
      return super.email(value);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mobileNumber(String number) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.mobileNumber');
    try {
      return super.mobileNumber(number);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mobileNumberCleared() {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.mobileNumberCleared');
    try {
      return super.mobileNumberCleared();
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNumberCode(MobileNumberCode? code) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.onNumberCode');
    try {
      return super.onNumberCode(code);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onReferralCode(String code) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.onReferralCode');
    try {
      return super.onReferralCode(code);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic termsConditionClicked() {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.termsConditionClicked');
    try {
      return super.termsConditionClicked();
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onState(Package? state) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.onState');
    try {
      return super.onState(state);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDistrict(Package? district) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.onDistrict');
    try {
      return super.onDistrict(district);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCity(Package? city) {
    final _$actionInfo = _$_WelcomeJaduRideScreenStoreActionController
        .startAction(name: '_WelcomeJaduRideScreenStore.onCity');
    try {
      return super.onCity(city);
    } finally {
      _$_WelcomeJaduRideScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingLoader: ${gettingLoader},
userMobileNumber: ${userMobileNumber},
states: ${states},
districts: ${districts},
cities: ${cities},
codes: ${codes},
selectedCode: ${selectedCode},
selectedDistrict: ${selectedDistrict},
selectedState: ${selectedState},
selectedCity: ${selectedCity},
gettingDistrictsLoader: ${gettingDistrictsLoader},
gettingCitiesLoader: ${gettingCitiesLoader},
userName: ${userName},
userEmail: ${userEmail},
referralCode: ${referralCode},
isTermsSelected: ${isTermsSelected},
enableBtn: ${enableBtn},
uploadingLoader: ${uploadingLoader},
emailValidator: ${emailValidator}
    ''';
  }
}
