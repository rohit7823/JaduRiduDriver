// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_audit_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VehicleAuditStore on _VehicleAuditScreenStore, Store {
  late final _$requiredStepsAtom =
      Atom(name: '_VehicleAuditScreenStore.requiredSteps', context: context);

  @override
  List<VehicleAuditStep> get requiredSteps {
    _$requiredStepsAtom.reportRead();
    return super.requiredSteps;
  }

  @override
  set requiredSteps(List<VehicleAuditStep> value) {
    _$requiredStepsAtom.reportWrite(value, super.requiredSteps, () {
      super.requiredSteps = value;
    });
  }

  late final _$gettingDataLoaderAtom = Atom(
      name: '_VehicleAuditScreenStore.gettingDataLoader', context: context);

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

  late final _$requiredStoreAtom =
      Atom(name: '_VehicleAuditScreenStore.requiredStore', context: context);

  @override
  Store? get requiredStore {
    _$requiredStoreAtom.reportRead();
    return super.requiredStore;
  }

  @override
  set requiredStore(Store? value) {
    _$requiredStoreAtom.reportWrite(value, super.requiredStore, () {
      super.requiredStore = value;
    });
  }

  late final _$enableBtnAtom =
      Atom(name: '_VehicleAuditScreenStore.enableBtn', context: context);

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

  late final _$informMassageAtom =
      Atom(name: '_VehicleAuditScreenStore.informMassage', context: context);

  @override
  String get informMassage {
    _$informMassageAtom.reportRead();
    return super.informMassage;
  }

  @override
  set informMassage(String value) {
    _$informMassageAtom.reportWrite(value, super.informMassage, () {
      super.informMassage = value;
    });
  }

  late final _$getRequiredStepsAsyncAction = AsyncAction(
      '_VehicleAuditScreenStore.getRequiredSteps',
      context: context);

  @override
  Future getRequiredSteps() {
    return _$getRequiredStepsAsyncAction.run(() => super.getRequiredSteps());
  }

  late final _$_VehicleAuditScreenStoreActionController =
      ActionController(name: '_VehicleAuditScreenStore', context: context);

  @override
  dynamic onStepClicked(VehicleAuditStep step) {
    final _$actionInfo = _$_VehicleAuditScreenStoreActionController.startAction(
        name: '_VehicleAuditScreenStore.onStepClicked');
    try {
      return super.onStepClicked(step);
    } finally {
      _$_VehicleAuditScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDone() {
    final _$actionInfo = _$_VehicleAuditScreenStoreActionController.startAction(
        name: '_VehicleAuditScreenStore.onDone');
    try {
      return super.onDone();
    } finally {
      _$_VehicleAuditScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requiredSteps: ${requiredSteps},
gettingDataLoader: ${gettingDataLoader},
requiredStore: ${requiredStore},
enableBtn: ${enableBtn},
informMassage: ${informMassage}
    ''';
  }
}
