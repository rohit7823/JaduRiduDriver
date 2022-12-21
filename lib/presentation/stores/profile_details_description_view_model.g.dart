// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_description_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileDescriptionStore on _ProfileDescriptionViewModel, Store {
  late final _$gettingLoaderAtom = Atom(
      name: '_ProfileDescriptionViewModel.gettingLoader', context: context);

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
      name: '_ProfileDescriptionViewModel.userMobileNumber', context: context);

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
      Atom(name: '_ProfileDescriptionViewModel.states', context: context);

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
      Atom(name: '_ProfileDescriptionViewModel.districts', context: context);

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
      Atom(name: '_ProfileDescriptionViewModel.cities', context: context);

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
      Atom(name: '_ProfileDescriptionViewModel.codes', context: context);

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
      Atom(name: '_ProfileDescriptionViewModel.selectedCode', context: context);

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
      name: '_ProfileDescriptionViewModel.selectedDistrict', context: context);

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

  late final _$selectedStateAtom = Atom(
      name: '_ProfileDescriptionViewModel.selectedState', context: context);

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
      Atom(name: '_ProfileDescriptionViewModel.selectedCity', context: context);

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

  late final _$openImagePickerAtom = Atom(
      name: '_ProfileDescriptionViewModel.openImagePicker', context: context);

  @override
  DialogState get openImagePicker {
    _$openImagePickerAtom.reportRead();
    return super.openImagePicker;
  }

  @override
  set openImagePicker(DialogState value) {
    _$openImagePickerAtom.reportWrite(value, super.openImagePicker, () {
      super.openImagePicker = value;
    });
  }

  late final _$imageAtom =
      Atom(name: '_ProfileDescriptionViewModel.image', context: context);

  @override
  String get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(String value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$selectedImageAtom = Atom(
      name: '_ProfileDescriptionViewModel.selectedImage', context: context);

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$checkStatusAtom =
      Atom(name: '_ProfileDescriptionViewModel.checkStatus', context: context);

  @override
  bool get checkStatus {
    _$checkStatusAtom.reportRead();
    return super.checkStatus;
  }

  @override
  set checkStatus(bool value) {
    _$checkStatusAtom.reportWrite(value, super.checkStatus, () {
      super.checkStatus = value;
    });
  }

  late final _$gettingDistrictsLoaderAtom = Atom(
      name: '_ProfileDescriptionViewModel.gettingDistrictsLoader',
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
      name: '_ProfileDescriptionViewModel.gettingCitiesLoader',
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
      Atom(name: '_ProfileDescriptionViewModel.userName', context: context);

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
      Atom(name: '_ProfileDescriptionViewModel.userEmail', context: context);

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

  late final _$uploadingLoaderAtom = Atom(
      name: '_ProfileDescriptionViewModel.uploadingLoader', context: context);

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

  late final _$genderSelectedAtom = Atom(
      name: '_ProfileDescriptionViewModel.genderSelected', context: context);

  @override
  String get genderSelected {
    _$genderSelectedAtom.reportRead();
    return super.genderSelected;
  }

  @override
  set genderSelected(String value) {
    _$genderSelectedAtom.reportWrite(value, super.genderSelected, () {
      super.genderSelected = value;
    });
  }

  late final _$informMessageAtom = Atom(
      name: '_ProfileDescriptionViewModel.informMessage', context: context);

  @override
  String get informMessage {
    _$informMessageAtom.reportRead();
    return super.informMessage;
  }

  @override
  set informMessage(String value) {
    _$informMessageAtom.reportWrite(value, super.informMessage, () {
      super.informMessage = value;
    });
  }

  late final _$selectedGenderAtom = Atom(
      name: '_ProfileDescriptionViewModel.selectedGender', context: context);

  @override
  String get selectedGender {
    _$selectedGenderAtom.reportRead();
    return super.selectedGender;
  }

  @override
  set selectedGender(String value) {
    _$selectedGenderAtom.reportWrite(value, super.selectedGender, () {
      super.selectedGender = value;
    });
  }

  late final _$selectedAtom =
      Atom(name: '_ProfileDescriptionViewModel.selected', context: context);

  @override
  GenderRadio get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(GenderRadio value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$finalCurrentDateAtom = Atom(
      name: '_ProfileDescriptionViewModel.finalCurrentDate', context: context);

  @override
  String get finalCurrentDate {
    _$finalCurrentDateAtom.reportRead();
    return super.finalCurrentDate;
  }

  @override
  set finalCurrentDate(String value) {
    _$finalCurrentDateAtom.reportWrite(value, super.finalCurrentDate, () {
      super.finalCurrentDate = value;
    });
  }

  late final _$_initialDataAsyncAction = AsyncAction(
      '_ProfileDescriptionViewModel._initialData',
      context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  late final _$getDistrictsAsyncAction = AsyncAction(
      '_ProfileDescriptionViewModel.getDistricts',
      context: context);

  @override
  Future getDistricts() {
    return _$getDistrictsAsyncAction.run(() => super.getDistricts());
  }

  late final _$getCitiesAsyncAction =
      AsyncAction('_ProfileDescriptionViewModel.getCities', context: context);

  @override
  Future getCities() {
    return _$getCitiesAsyncAction.run(() => super.getCities());
  }

  late final _$chooseFromCameraAsyncAction = AsyncAction(
      '_ProfileDescriptionViewModel.chooseFromCamera',
      context: context);

  @override
  Future chooseFromCamera() {
    return _$chooseFromCameraAsyncAction.run(() => super.chooseFromCamera());
  }

  late final _$chooseFromGalleryAsyncAction = AsyncAction(
      '_ProfileDescriptionViewModel.chooseFromGallery',
      context: context);

  @override
  Future chooseFromGallery() {
    return _$chooseFromGalleryAsyncAction.run(() => super.chooseFromGallery());
  }

  late final _$_ProfileDescriptionViewModelActionController =
      ActionController(name: '_ProfileDescriptionViewModel', context: context);

  @override
  dynamic selectImage() {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.selectImage');
    try {
      return super.selectImage();
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic name(String value) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.name');
    try {
      return super.name(value);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic email(String value) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.email');
    try {
      return super.email(value);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mobileNumber(String number) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.mobileNumber');
    try {
      return super.mobileNumber(number);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic mobileNumberCleared() {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.mobileNumberCleared');
    try {
      return super.mobileNumberCleared();
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNumberCode(MobileNumberCode? code) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.onNumberCode');
    try {
      return super.onNumberCode(code);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onState(Package? state) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.onState');
    try {
      return super.onState(state);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDistrict(Package? district) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.onDistrict');
    try {
      return super.onDistrict(district);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onCity(Package? city) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.onCity');
    try {
      return super.onCity(city);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRadioSelected(GenderRadio? selectedValue) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.onRadioSelected');
    try {
      return super.onRadioSelected(selectedValue);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onClose() {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.onClose');
    try {
      return super.onClose();
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectDate(DateTime? selected) {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.onSelectDate');
    try {
      return super.onSelectDate(selected);
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearImage() {
    final _$actionInfo = _$_ProfileDescriptionViewModelActionController
        .startAction(name: '_ProfileDescriptionViewModel.clearImage');
    try {
      return super.clearImage();
    } finally {
      _$_ProfileDescriptionViewModelActionController.endAction(_$actionInfo);
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
openImagePicker: ${openImagePicker},
image: ${image},
selectedImage: ${selectedImage},
checkStatus: ${checkStatus},
gettingDistrictsLoader: ${gettingDistrictsLoader},
gettingCitiesLoader: ${gettingCitiesLoader},
userName: ${userName},
userEmail: ${userEmail},
uploadingLoader: ${uploadingLoader},
genderSelected: ${genderSelected},
informMessage: ${informMessage},
selectedGender: ${selectedGender},
selected: ${selected},
finalCurrentDate: ${finalCurrentDate}
    ''';
  }
}
