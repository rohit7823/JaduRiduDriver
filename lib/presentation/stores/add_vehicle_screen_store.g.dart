// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddVehicleStore on _AddVehicleScreenStore, Store {
  late final _$gettingDataLoaderAtom =
      Atom(name: '_AddVehicleScreenStore.gettingDataLoader', context: context);

  @override
  bool get gettingDataLoader {
    _$gettingDataLoaderAtom.reportRead();
    return super.gettingDataLoader;
  }

  @override
  set gettingDataLoader(bool value) {
    _$gettingDataLoaderAtom.reportWrite(value, super.gettingDataLoader, () {
      super.gettingDataLoader = value;
    });
  }

  late final _$vCategoriesAtom =
      Atom(name: '_AddVehicleScreenStore.vCategories', context: context);

  @override
  List<VehicleCategory> get vCategories {
    _$vCategoriesAtom.reportRead();
    return super.vCategories;
  }

  @override
  set vCategories(List<VehicleCategory> value) {
    _$vCategoriesAtom.reportWrite(value, super.vCategories, () {
      super.vCategories = value;
    });
  }

  late final _$carCategoriesAtom =
      Atom(name: '_AddVehicleScreenStore.carCategories', context: context);

  @override
  List<CarCategory> get carCategories {
    _$carCategoriesAtom.reportRead();
    return super.carCategories;
  }

  @override
  set carCategories(List<CarCategory> value) {
    _$carCategoriesAtom.reportWrite(value, super.carCategories, () {
      super.carCategories = value;
    });
  }

  late final _$addingLoaderAtom =
      Atom(name: '_AddVehicleScreenStore.addingLoader', context: context);

  @override
  bool get addingLoader {
    _$addingLoaderAtom.reportRead();
    return super.addingLoader;
  }

  @override
  set addingLoader(bool value) {
    _$addingLoaderAtom.reportWrite(value, super.addingLoader, () {
      super.addingLoader = value;
    });
  }

  late final _$addingcLoaderAtom =
      Atom(name: '_AddVehicleScreenStore.addingcLoader', context: context);

  @override
  bool get addingcLoader {
    _$addingcLoaderAtom.reportRead();
    return super.addingcLoader;
  }

  @override
  set addingcLoader(bool value) {
    _$addingcLoaderAtom.reportWrite(value, super.addingcLoader, () {
      super.addingcLoader = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_AddVehicleScreenStore.selectedCategory', context: context);

  @override
  VehicleCategory? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(VehicleCategory? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectcarAtom =
      Atom(name: '_AddVehicleScreenStore.selectcar', context: context);

  @override
  CarCategory? get selectcar {
    _$selectcarAtom.reportRead();
    return super.selectcar;
  }

  @override
  set selectcar(CarCategory? value) {
    _$selectcarAtom.reportWrite(value, super.selectcar, () {
      super.selectcar = value;
    });
  }

  late final _$vehicleNumberAtom =
      Atom(name: '_AddVehicleScreenStore.vehicleNumber', context: context);

  @override
  String get vehicleNumber {
    _$vehicleNumberAtom.reportRead();
    return super.vehicleNumber;
  }

  @override
  set vehicleNumber(String value) {
    _$vehicleNumberAtom.reportWrite(value, super.vehicleNumber, () {
      super.vehicleNumber = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_AddVehicleScreenStore.enableBtn', context: context);

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

  late final _$_validateInputsAsyncAction =
      AsyncAction('_AddVehicleScreenStore._validateInputs', context: context);

  @override
  Future _validateInputs() {
    return _$_validateInputsAsyncAction.run(() => super._validateInputs());
  }

  late final _$_getInitialDataAsyncAction =
      AsyncAction('_AddVehicleScreenStore._getInitialData', context: context);

  @override
  Future _getInitialData() {
    return _$_getInitialDataAsyncAction.run(() => super._getInitialData());
  }

  late final _$addVehicleAsyncAction =
      AsyncAction('_AddVehicleScreenStore.addVehicle', context: context);

  @override
  Future addVehicle() {
    return _$addVehicleAsyncAction.run(() => super.addVehicle());
  }

  late final _$addCarAsyncAction =
      AsyncAction('_AddVehicleScreenStore.addCar', context: context);

  @override
  Future addCar() {
    return _$addCarAsyncAction.run(() => super.addCar());
  }

  late final _$_AddVehicleScreenStoreActionController =
      ActionController(name: '_AddVehicleScreenStore', context: context);

  @override
  dynamic onSelectCategory(VehicleCategory? category) {
    final _$actionInfo = _$_AddVehicleScreenStoreActionController.startAction(
        name: '_AddVehicleScreenStore.onSelectCategory');
    try {
      return super.onSelectCategory(category);
    } finally {
      _$_AddVehicleScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSelectcarCategory(CarCategory? carcategory) {
    final _$actionInfo = _$_AddVehicleScreenStoreActionController.startAction(
        name: '_AddVehicleScreenStore.onSelectcarCategory');
    try {
      return super.onSelectcarCategory(carcategory);
    } finally {
      _$_AddVehicleScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onVehicleNumber(String number) {
    final _$actionInfo = _$_AddVehicleScreenStoreActionController.startAction(
        name: '_AddVehicleScreenStore.onVehicleNumber');
    try {
      return super.onVehicleNumber(number);
    } finally {
      _$_AddVehicleScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingDataLoader: ${gettingDataLoader},
vCategories: ${vCategories},
carCategories: ${carCategories},
addingLoader: ${addingLoader},
addingcLoader: ${addingcLoader},
selectedCategory: ${selectedCategory},
selectcar: ${selectcar},
vehicleNumber: ${vehicleNumber},
enableBtn: ${enableBtn}
    ''';
  }
}
