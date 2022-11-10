import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/common/alert_action.dart';
import '../../core/common/alert_behaviour.dart';
import '../../core/common/alert_data.dart';
import '../../core/common/alert_option.dart';
import '../../core/common/response.dart';
import '../../core/helpers/storage.dart';
import '../../core/helpers/validator.dart';
import '../../core/repository/help_repository.dart';
import '../../modules/app_module.dart';
import '../../utills/dialog_manager.dart';
import '../../utills/my_utils.dart';
import '../ui/string_provider.dart';

part 'help_view_model.g.dart';

class HelpStore = _HelpViewModel with _$HelpStore;

abstract class _HelpViewModel with Store {
  final _repository = dependency<HelpRepository>();
  final _storage = dependency<Storage>();
  final dialogManager = DialogManager();
  final _validator = dependency<Validator>();

  @observable
  bool isLoader = false;

  @observable
  String helpPhoneNumber = "";

  @observable
  String name = "";

  @observable
  String email = "";

  @observable
  String subject = "";

  @observable
  String message = "";

  @observable
  String msg = "";

  _HelpViewModel() {
    _initialData();
  }

  @action
  _initialData() async {
    isLoader = true;
    var userId = _storage.userId();
    var response = await _repository.getHelpInittialData(userId);
    //debugPrint(response.toString());
    if (response is Success) {
      var data = response.data;
      isLoader = false;
      switch (data != null && data.status) {
        case true:
          msg = data!.message;
          helpPhoneNumber = data.helpPhoneNumber;

          break;
        default:
          dialogManager.initErrorData(AlertData(
              StringProvider.error,
              null,
              StringProvider.appId,
              data?.message ?? "",
              StringProvider.retry,
              null,
              null,
              AlertBehaviour(
                  option: AlertOption.invokeOnBarrier,
                  action: AlertAction.welcomeJaduRideInitialData)));
      }
    } else if (response is Error) {
      isLoader = false;
      dialogManager.initErrorData(AlertData(
          StringProvider.error,
          null,
          StringProvider.appId,
          response.message ?? "",
          StringProvider.retry,
          null,
          null,
          AlertBehaviour(
              option: AlertOption.invokeOnBarrier,
              action: AlertAction.welcomeJaduRideInitialData)));
    }
  }

  @observable
  String userInputName = "";

  @observable
  String userInputEmail = "";

  @observable
  String userInputSubject = "";

  @observable
  String userInputMsg = "";

  @observable
  String errorMsg = "";

  @observable
  String errorMessageMsg = "";

  @observable
  String informMessage = "";

  @action
  onName(String name) {
    userInputName = name;
  }

  @action
  onEmail(String email) {
    userInputEmail = email;
  }

  @action
  onSubject(String subject) {
    userInputSubject = subject;
  }

  @action
  onMessage(String msg) {
    userInputMsg = msg;
  }

  @action
  onPressed(

      TextEditingController _nameController,
      TextEditingController _emailController,
      TextEditingController _subjectController,
      TextEditingController _msgController) async {
    if (_validator.isEmailValid(userInputEmail) == false ||
        userInputMsg.isEmpty) {
      isLoader = true;
    } else {
      isLoader = true;
      //var userId = _storage.userId();
      var response = await _repository.uploadInqueryData(
          _storage.userId(), userInputName, userInputEmail, userInputSubject, userInputMsg);
      if (response is Success) {
        var data = response.data;
        switch (data != null && data.status) {
          case true:
            if (data!.isSubmitted) {
              informMessage = data.message;
              _nameController.clear();
              _emailController.clear();
              _subjectController.clear();
              _msgController.clear();
              MyUtils.toastMessage("Success....");
              isLoader = false;
            }
        }
      } else if (response is Error) {
        MyUtils.toastMessage("Error found....");
      }
      isLoader = false;
    }
  }

  @action
  validateInput() async {
    while (true) {
      if (userInputEmail.isEmpty) {
        errorMsg = "Your email is empty";
        isLoader = false;
      } else if (_validator.isEmailValid(userInputEmail) == false) {
        errorMsg = "Please enter correct email";
        isLoader = false;
      } else {
        errorMsg = "";
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

  @action
  validateInputMessage() async {
    while (true) {
      //debugPrint(_validator.isEmailValid(userInputEmail).toString());
      if (userInputMsg.isEmpty) {
        errorMessageMsg = "Your message is empty";
      } else {
        errorMessageMsg = "";
      }
      await Future.delayed(const Duration(milliseconds: 300));
    }
  }

}
