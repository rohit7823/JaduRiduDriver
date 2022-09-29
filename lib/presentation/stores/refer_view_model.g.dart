// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refer_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ReferStore on _ReferViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ReferViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$driverToDriverAtom =
      Atom(name: '_ReferViewModel.driverToDriver', context: context);

  @override
  int get driverToDriver {
    _$driverToDriverAtom.reportRead();
    return super.driverToDriver;
  }

  @override
  set driverToDriver(int value) {
    _$driverToDriverAtom.reportWrite(value, super.driverToDriver, () {
      super.driverToDriver = value;
    });
  }

  late final _$driverToCustomerAtom =
      Atom(name: '_ReferViewModel.driverToCustomer', context: context);

  @override
  int get driverToCustomer {
    _$driverToCustomerAtom.reportRead();
    return super.driverToCustomer;
  }

  @override
  set driverToCustomer(int value) {
    _$driverToCustomerAtom.reportWrite(value, super.driverToCustomer, () {
      super.driverToCustomer = value;
    });
  }

  late final _$driverToDriverReferCodeAtom =
      Atom(name: '_ReferViewModel.driverToDriverReferCode', context: context);

  @override
  String get driverToDriverReferCode {
    _$driverToDriverReferCodeAtom.reportRead();
    return super.driverToDriverReferCode;
  }

  @override
  set driverToDriverReferCode(String value) {
    _$driverToDriverReferCodeAtom
        .reportWrite(value, super.driverToDriverReferCode, () {
      super.driverToDriverReferCode = value;
    });
  }

  late final _$driverToCustomerReferCodeAtom =
      Atom(name: '_ReferViewModel.driverToCustomerReferCode', context: context);

  @override
  String get driverToCustomerReferCode {
    _$driverToCustomerReferCodeAtom.reportRead();
    return super.driverToCustomerReferCode;
  }

  @override
  set driverToCustomerReferCode(String value) {
    _$driverToCustomerReferCodeAtom
        .reportWrite(value, super.driverToCustomerReferCode, () {
      super.driverToCustomerReferCode = value;
    });
  }

  late final _$msgAtom = Atom(name: '_ReferViewModel.msg', context: context);

  @override
  String get msg {
    _$msgAtom.reportRead();
    return super.msg;
  }

  @override
  set msg(String value) {
    _$msgAtom.reportWrite(value, super.msg, () {
      super.msg = value;
    });
  }

  late final _$_initialDataAsyncAction =
      AsyncAction('_ReferViewModel._initialData', context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
driverToDriver: ${driverToDriver},
driverToCustomer: ${driverToCustomer},
driverToDriverReferCode: ${driverToDriverReferCode},
driverToCustomerReferCode: ${driverToCustomerReferCode},
msg: ${msg}
    ''';
  }
}
