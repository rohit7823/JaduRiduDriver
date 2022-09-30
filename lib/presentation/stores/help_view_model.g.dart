// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HelpStore on _HelpViewModel, Store {
  late final _$isLoaderAtom =
      Atom(name: '_HelpViewModel.isLoader', context: context);

  @override
  bool get isLoader {
    _$isLoaderAtom.reportRead();
    return super.isLoader;
  }

  @override
  set isLoader(bool value) {
    _$isLoaderAtom.reportWrite(value, super.isLoader, () {
      super.isLoader = value;
    });
  }

  late final _$helpPhoneNumberAtom =
      Atom(name: '_HelpViewModel.helpPhoneNumber', context: context);

  @override
  String get helpPhoneNumber {
    _$helpPhoneNumberAtom.reportRead();
    return super.helpPhoneNumber;
  }

  @override
  set helpPhoneNumber(String value) {
    _$helpPhoneNumberAtom.reportWrite(value, super.helpPhoneNumber, () {
      super.helpPhoneNumber = value;
    });
  }

  late final _$nameAtom = Atom(name: '_HelpViewModel.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom = Atom(name: '_HelpViewModel.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$subjectAtom =
      Atom(name: '_HelpViewModel.subject', context: context);

  @override
  String get subject {
    _$subjectAtom.reportRead();
    return super.subject;
  }

  @override
  set subject(String value) {
    _$subjectAtom.reportWrite(value, super.subject, () {
      super.subject = value;
    });
  }

  late final _$messageAtom =
      Atom(name: '_HelpViewModel.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$msgAtom = Atom(name: '_HelpViewModel.msg', context: context);

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

  late final _$userInputNameAtom =
      Atom(name: '_HelpViewModel.userInputName', context: context);

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
      Atom(name: '_HelpViewModel.userInputEmail', context: context);

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
      Atom(name: '_HelpViewModel.userInputSubject', context: context);

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
      Atom(name: '_HelpViewModel.userInputMsg', context: context);

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
      Atom(name: '_HelpViewModel.errorMsg', context: context);

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
      Atom(name: '_HelpViewModel.errorMessageMsg', context: context);

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
      Atom(name: '_HelpViewModel.informMessage', context: context);

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

  late final _$_initialDataAsyncAction =
      AsyncAction('_HelpViewModel._initialData', context: context);

  @override
  Future _initialData() {
    return _$_initialDataAsyncAction.run(() => super._initialData());
  }

  late final _$onPressedAsyncAction =
      AsyncAction('_HelpViewModel.onPressed', context: context);

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
      AsyncAction('_HelpViewModel.validateInput', context: context);

  @override
  Future validateInput() {
    return _$validateInputAsyncAction.run(() => super.validateInput());
  }

  late final _$validateInputMessageAsyncAction =
      AsyncAction('_HelpViewModel.validateInputMessage', context: context);

  @override
  Future validateInputMessage() {
    return _$validateInputMessageAsyncAction
        .run(() => super.validateInputMessage());
  }

  late final _$_HelpViewModelActionController =
      ActionController(name: '_HelpViewModel', context: context);

  @override
  dynamic onName(String name) {
    final _$actionInfo = _$_HelpViewModelActionController.startAction(
        name: '_HelpViewModel.onName');
    try {
      return super.onName(name);
    } finally {
      _$_HelpViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmail(String email) {
    final _$actionInfo = _$_HelpViewModelActionController.startAction(
        name: '_HelpViewModel.onEmail');
    try {
      return super.onEmail(email);
    } finally {
      _$_HelpViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSubject(String subject) {
    final _$actionInfo = _$_HelpViewModelActionController.startAction(
        name: '_HelpViewModel.onSubject');
    try {
      return super.onSubject(subject);
    } finally {
      _$_HelpViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onMessage(String msg) {
    final _$actionInfo = _$_HelpViewModelActionController.startAction(
        name: '_HelpViewModel.onMessage');
    try {
      return super.onMessage(msg);
    } finally {
      _$_HelpViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoader: ${isLoader},
helpPhoneNumber: ${helpPhoneNumber},
name: ${name},
email: ${email},
subject: ${subject},
message: ${message},
msg: ${msg},
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
