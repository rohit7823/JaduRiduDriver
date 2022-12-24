// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SharedStore on _SharedStore, Store {
  late final _$gettingIntroDataLoaderAtom =
      Atom(name: '_SharedStore.gettingIntroDataLoader', context: context);

  @override
  bool get gettingIntroDataLoader {
    _$gettingIntroDataLoaderAtom.reportRead();
    return super.gettingIntroDataLoader;
  }

  @override
  set gettingIntroDataLoader(bool value) {
    _$gettingIntroDataLoaderAtom
        .reportWrite(value, super.gettingIntroDataLoader, () {
      super.gettingIntroDataLoader = value;
    });
  }

  late final _$callSuccessAtom =
      Atom(name: '_SharedStore.callSuccess', context: context);

  @override
  bool get callSuccess {
    _$callSuccessAtom.reportRead();
    return super.callSuccess;
  }

  @override
  set callSuccess(bool value) {
    _$callSuccessAtom.reportWrite(value, super.callSuccess, () {
      super.callSuccess = value;
    });
  }

  late final _$gettingDataLoaderAtom =
      Atom(name: '_SharedStore.gettingDataLoader', context: context);

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

  late final _$selectedMenuAtom =
      Atom(name: '_SharedStore.selectedMenu', context: context);

  @override
  int get selectedMenu {
    _$selectedMenuAtom.reportRead();
    return super.selectedMenu;
  }

  @override
  set selectedMenu(int value) {
    _$selectedMenuAtom.reportWrite(value, super.selectedMenu, () {
      super.selectedMenu = value;
    });
  }

  late final _$isVisibleAtom =
      Atom(name: '_SharedStore.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$dropLocationDataAtom =
      Atom(name: '_SharedStore.dropLocationData', context: context);

  @override
  RideLocationResponse? get dropLocationData {
    _$dropLocationDataAtom.reportRead();
    return super.dropLocationData;
  }

  @override
  set dropLocationData(RideLocationResponse? value) {
    _$dropLocationDataAtom.reportWrite(value, super.dropLocationData, () {
      super.dropLocationData = value;
    });
  }

  late final _$currentBalanceAtom =
      Atom(name: '_SharedStore.currentBalance', context: context);

  @override
  String? get currentBalance {
    _$currentBalanceAtom.reportRead();
    return super.currentBalance;
  }

  @override
  set currentBalance(String? value) {
    _$currentBalanceAtom.reportWrite(value, super.currentBalance, () {
      super.currentBalance = value;
    });
  }

  late final _$emergencyLoadingAtom =
      Atom(name: '_SharedStore.emergencyLoading', context: context);

  @override
  bool get emergencyLoading {
    _$emergencyLoadingAtom.reportRead();
    return super.emergencyLoading;
  }

  @override
  set emergencyLoading(bool value) {
    _$emergencyLoadingAtom.reportWrite(value, super.emergencyLoading, () {
      super.emergencyLoading = value;
    });
  }

  late final _$rideFareResponseAtom =
      Atom(name: '_SharedStore.rideFareResponse', context: context);

  @override
  TotalRideFareResponse? get rideFareResponse {
    _$rideFareResponseAtom.reportRead();
    return super.rideFareResponse;
  }

  @override
  set rideFareResponse(TotalRideFareResponse? value) {
    _$rideFareResponseAtom.reportWrite(value, super.rideFareResponse, () {
      super.rideFareResponse = value;
    });
  }

  late final _$notificationPayloadAtom =
      Atom(name: '_SharedStore.notificationPayload', context: context);

  @override
  NotificationPayload? get notificationPayload {
    _$notificationPayloadAtom.reportRead();
    return super.notificationPayload;
  }

  @override
  set notificationPayload(NotificationPayload? value) {
    _$notificationPayloadAtom.reportWrite(value, super.notificationPayload, () {
      super.notificationPayload = value;
    });
  }

  late final _$getIntroPageDataAsyncAction =
      AsyncAction('_SharedStore.getIntroPageData', context: context);

  @override
  Future getIntroPageData() {
    return _$getIntroPageDataAsyncAction.run(() => super.getIntroPageData());
  }

  late final _$hidePartnercarerNavAsyncAction =
      AsyncAction('_SharedStore.hidePartnercarerNav', context: context);

  @override
  Future hidePartnercarerNav(bool isFocused) {
    return _$hidePartnercarerNavAsyncAction
        .run(() => super.hidePartnercarerNav(isFocused));
  }

  late final _$getLoginRegistrationPageDataAsyncAction = AsyncAction(
      '_SharedStore.getLoginRegistrationPageData',
      context: context);

  @override
  Future getLoginRegistrationPageData() {
    return _$getLoginRegistrationPageDataAsyncAction
        .run(() => super.getLoginRegistrationPageData());
  }

  late final _$getDashBoardDataAsyncAction =
      AsyncAction('_SharedStore.getDashBoardData', context: context);

  @override
  Future getDashBoardData() {
    return _$getDashBoardDataAsyncAction.run(() => super.getDashBoardData());
  }

  late final _$onOkayAsyncAction =
      AsyncAction('_SharedStore.onOkay', context: context);

  @override
  Future onOkay(BookingStatus status) {
    return _$onOkayAsyncAction.run(() => super.onOkay(status));
  }

  late final _$handleNotificationPayloadAsyncAction =
      AsyncAction('_SharedStore.handleNotificationPayload', context: context);

  @override
  Future handleNotificationPayload(String? payload) {
    return _$handleNotificationPayloadAsyncAction
        .run(() => super.handleNotificationPayload(payload));
  }

  late final _$onClickEmergencyAsyncAction =
      AsyncAction('_SharedStore.onClickEmergency', context: context);

  @override
  Future onClickEmergency() {
    return _$onClickEmergencyAsyncAction.run(() => super.onClickEmergency());
  }

  late final _$_SharedStoreActionController =
      ActionController(name: '_SharedStore', context: context);

  @override
  dynamic onBottomMenu(int index) {
    final _$actionInfo = _$_SharedStoreActionController.startAction(
        name: '_SharedStore.onBottomMenu');
    try {
      return super.onBottomMenu(index);
    } finally {
      _$_SharedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setDropLocations(RideLocationResponse response) {
    final _$actionInfo = _$_SharedStoreActionController.startAction(
        name: '_SharedStore._setDropLocations');
    try {
      return super._setDropLocations(response);
    } finally {
      _$_SharedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onChangeCurrentBalance(String data) {
    final _$actionInfo = _$_SharedStoreActionController.startAction(
        name: '_SharedStore.onChangeCurrentBalance');
    try {
      return super.onChangeCurrentBalance(data);
    } finally {
      _$_SharedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _setTotalRideFare(TotalRideFareResponse response) {
    final _$actionInfo = _$_SharedStoreActionController.startAction(
        name: '_SharedStore._setTotalRideFare');
    try {
      return super._setTotalRideFare(response);
    } finally {
      _$_SharedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gettingIntroDataLoader: ${gettingIntroDataLoader},
callSuccess: ${callSuccess},
gettingDataLoader: ${gettingDataLoader},
selectedMenu: ${selectedMenu},
isVisible: ${isVisible},
dropLocationData: ${dropLocationData},
currentBalance: ${currentBalance},
emergencyLoading: ${emergencyLoading},
rideFareResponse: ${rideFareResponse},
notificationPayload: ${notificationPayload}
    ''';
  }
}
