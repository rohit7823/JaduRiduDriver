// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DutyStore on _DutyScreenStore, Store {
  late final _$bookingCountAtom =
      Atom(name: '_DutyScreenStore.bookingCount', context: context);

  @override
  String get bookingCount {
    _$bookingCountAtom.reportRead();
    return super.bookingCount;
  }

  @override
  set bookingCount(String value) {
    _$bookingCountAtom.reportWrite(value, super.bookingCount, () {
      super.bookingCount = value;
    });
  }

  late final _$operatorBillAtom =
      Atom(name: '_DutyScreenStore.operatorBill', context: context);

  @override
  String get operatorBill {
    _$operatorBillAtom.reportRead();
    return super.operatorBill;
  }

  @override
  set operatorBill(String value) {
    _$operatorBillAtom.reportWrite(value, super.operatorBill, () {
      super.operatorBill = value;
    });
  }

  late final _$timeStampAtom =
      Atom(name: '_DutyScreenStore.timeStamp', context: context);

  @override
  String get timeStamp {
    _$timeStampAtom.reportRead();
    return super.timeStamp;
  }

  @override
  set timeStamp(String value) {
    _$timeStampAtom.reportWrite(value, super.timeStamp, () {
      super.timeStamp = value;
    });
  }

  late final _$selectedStatusAtom =
      Atom(name: '_DutyScreenStore.selectedStatus', context: context);

  @override
  DriverStatus get selectedStatus {
    _$selectedStatusAtom.reportRead();
    return super.selectedStatus;
  }

  @override
  set selectedStatus(DriverStatus value) {
    _$selectedStatusAtom.reportWrite(value, super.selectedStatus, () {
      super.selectedStatus = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: '_DutyScreenStore.errorMsg', context: context);

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  late final _$_DutyScreenStoreActionController =
      ActionController(name: '_DutyScreenStore', context: context);

  @override
  dynamic onDriverStatusChanged(int idx) {
    final _$actionInfo = _$_DutyScreenStoreActionController.startAction(
        name: '_DutyScreenStore.onDriverStatusChanged');
    try {
      return super.onDriverStatusChanged(idx);
    } finally {
      _$_DutyScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bookingCount: ${bookingCount},
operatorBill: ${operatorBill},
timeStamp: ${timeStamp},
selectedStatus: ${selectedStatus},
errorMsg: ${errorMsg}
    ''';
  }
}
