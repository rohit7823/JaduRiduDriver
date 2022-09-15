// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_care_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PartnerCareStore on _PartnerCareViewModel, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PartnerCareViewModel.isLoading', context: context);

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

  late final _$userInputNameAtom =
      Atom(name: '_PartnerCareViewModel.userInputName', context: context);

  @override
  String get userInputName {
    _$userInputNameAtom.reportRead();
    return super.userInputName;
  }

  @override
  set userInputName(String value) {
    _$userInputNameAtom.reportWrite(value, super.userInputName, () {
      super.userInputName = value;
    });
  }

  late final _$userInputEmailAtom =
      Atom(name: '_PartnerCareViewModel.userInputEmail', context: context);

  @override
  String get userInputEmail {
    _$userInputEmailAtom.reportRead();
    return super.userInputEmail;
  }

  @override
  set userInputEmail(String value) {
    _$userInputEmailAtom.reportWrite(value, super.userInputEmail, () {
      super.userInputEmail = value;
    });
  }

  late final _$userInputSubjectAtom =
      Atom(name: '_PartnerCareViewModel.userInputSubject', context: context);

  @override
  String get userInputSubject {
    _$userInputSubjectAtom.reportRead();
    return super.userInputSubject;
  }

  @override
  set userInputSubject(String value) {
    _$userInputSubjectAtom.reportWrite(value, super.userInputSubject, () {
      super.userInputSubject = value;
    });
  }

  late final _$userInputMsgAtom =
      Atom(name: '_PartnerCareViewModel.userInputMsg', context: context);

  @override
  String get userInputMsg {
    _$userInputMsgAtom.reportRead();
    return super.userInputMsg;
  }

  @override
  set userInputMsg(String value) {
    _$userInputMsgAtom.reportWrite(value, super.userInputMsg, () {
      super.userInputMsg = value;
    });
  }

  late final _$errorMsgAtom =
      Atom(name: '_PartnerCareViewModel.errorMsg', context: context);

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

  late final _$errorMessageMsgAtom =
      Atom(name: '_PartnerCareViewModel.errorMessageMsg', context: context);

  @override
  String get errorMessageMsg {
    _$errorMessageMsgAtom.reportRead();
    return super.errorMessageMsg;
  }

  @override
  set errorMessageMsg(String value) {
    _$errorMessageMsgAtom.reportWrite(value, super.errorMessageMsg, () {
      super.errorMessageMsg = value;
    });
  }

  late final _$informMessageAtom =
      Atom(name: '_PartnerCareViewModel.informMessage', context: context);

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

  late final _$onPressedAsyncAction =
      AsyncAction('_PartnerCareViewModel.onPressed', context: context);

  @override
  Future onPressed(
      TextEditingController _nameController,
      TextEditingController _emailController,
      TextEditingController _subjectController,
      TextEditingController _msgController) {
    return _$onPressedAsyncAction.run(() => super.onPressed(
        _nameController, _emailController, _subjectController, _msgController));
  }

  late final _$validateInputAsyncAction =
      AsyncAction('_PartnerCareViewModel.validateInput', context: context);

  @override
  Future validateInput() {
    return _$validateInputAsyncAction.run(() => super.validateInput());
  }

  late final _$validateInputMessageAsyncAction = AsyncAction(
      '_PartnerCareViewModel.validateInputMessage',
      context: context);

  @override
  Future validateInputMessage() {
    return _$validateInputMessageAsyncAction
        .run(() => super.validateInputMessage());
  }

  late final _$_PartnerCareViewModelActionController =
      ActionController(name: '_PartnerCareViewModel', context: context);

  @override
  dynamic onName(String name) {
    final _$actionInfo = _$_PartnerCareViewModelActionController.startAction(
        name: '_PartnerCareViewModel.onName');
    try {
      return super.onName(name);
    } finally {
      _$_PartnerCareViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmail(String email) {
    final _$actionInfo = _$_PartnerCareViewModelActionController.startAction(
        name: '_PartnerCareViewModel.onEmail');
    try {
      return super.onEmail(email);
    } finally {
      _$_PartnerCareViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSubject(String subject) {
    final _$actionInfo = _$_PartnerCareViewModelActionController.startAction(
        name: '_PartnerCareViewModel.onSubject');
    try {
      return super.onSubject(subject);
    } finally {
      _$_PartnerCareViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onMessage(String msg) {
    final _$actionInfo = _$_PartnerCareViewModelActionController.startAction(
        name: '_PartnerCareViewModel.onMessage');
    try {
      return super.onMessage(msg);
    } finally {
      _$_PartnerCareViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userInputName: ${userInputName},
userInputEmail: ${userInputEmail},
userInputSubject: ${userInputSubject},
userInputMsg: ${userInputMsg},
errorMsg: ${errorMsg},
errorMessageMsg: ${errorMessageMsg},
informMessage: ${informMessage}
    ''';
  }
}
